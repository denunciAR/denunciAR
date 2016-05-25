class ChangeComplaintType < ActiveRecord::Migration
  def change
  	change_column :complaints, :user_id, :string
  	change_column :complaints, :tweet_id, :string
  end
end
