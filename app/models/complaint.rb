class Complaint < ActiveRecord::Base

	validates :user, :user_id, :tweet_id, presence: :true
end