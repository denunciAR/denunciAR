class AddComplainedAt < ActiveRecord::Migration
  def change
  	add_column :complaints, :complained_at, :datetime
  end
end
