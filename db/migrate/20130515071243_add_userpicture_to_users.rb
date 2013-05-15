class AddUserpictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_picture, :string
  end
end
