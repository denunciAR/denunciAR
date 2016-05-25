class TwitterSearch
  include Sidekiq::Worker
  sidekiq_options queue: :twitter

  def perform
    latest_processed_id = Setting.twitter_latest_processed_id || 0
    twitter_client.search("@denunci_AR", result_type: "recent", since_id: latest_processed_id).collect do |tweet|
      begin
        Complaint.create!(user: tweet.user.name, user_id: tweet.user.id, tweet_id: tweet.id, text: tweet.text, rating: 0, complained_at: tweet.created_at)
        latest_processed_id = tweet.id if tweet.id > latest_processed_id
      rescue ActiveRecord::RecordInvalid => error
        logger.error(
          "User: #{tweet.user.name} - Tweet ID: #{tweet.id} - Text: #{tweet.text} - Error: #{error.message}"
        )
      end
    end
    Setting.twitter_latest_processed_id = latest_processed_id
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_app_id
      config.consumer_secret = Rails.application.secrets.twitter_app_secret
    end
  end

end
