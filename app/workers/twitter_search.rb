class TwitterSearch
  include Sidekiq::Worker
  sidekiq_options queue: :twitter

  def perform
    twitter_client.search("@denunci_AR", result_type: "recent").collect do |tweet|
      begin
        Complaint.create!(user: tweet.user.name, user_id: tweet.user.id, tweet_id: tweet.id, text: tweet.text, rating: 0, complained_at: tweet.created_at)
      rescue ActiveRecord::RecordInvalid => invalid
        logger.error(
          "User: #{tweet.user.name} - Tweet ID: #{tweet.id} - Text: #{tweet.text} - Error: #{invalid.record.errors}"
        )
end
    end
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_app_id
      config.consumer_secret = Rails.application.secrets.twitter_app_secret
    end
  end

end
