class Complaint < ActiveRecord::Base
	validates :user, :user_id, :tweet_id, presence: :true
	validates :tweet_id, uniqueness: :true
end