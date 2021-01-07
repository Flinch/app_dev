class RemoveCommentsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :comments, :string
  end
end
