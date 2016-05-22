class CreateComplaint < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
    	t.string :user
    	t.integer :user_id
    	t.integer :tweet_id
    	t.integer :rating
    	t.timestamps
    end
  end
end
