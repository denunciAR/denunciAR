class ComplaintTweetContext

  attr_reader :tweet

  def initialize(tweet)
    @tweet = tweet
  end

  def handle
    complaint = Complaint.new(
      user: tweet.user.name,
      user_id: tweet.user.id,
      tweet_id: tweet.id,
      text: tweet.text,
      rating: 0,
      complained_at: tweet.created_at
    )
    if tweet.geo?
      complaint.latitude = tweet.geo.lat
      complaint.longitude = tweet.geo.lng
    end
    complaint.save!
  end
end