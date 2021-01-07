class AddCommentsToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :comments, :string
  end
end
