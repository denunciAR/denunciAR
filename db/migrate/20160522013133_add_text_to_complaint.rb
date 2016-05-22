class AddTextToComplaint < ActiveRecord::Migration
  def change
  	add_column :complaints, :text, :text
  end
end
