class AddUseridAndLikeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :like, :integer
  end
end
