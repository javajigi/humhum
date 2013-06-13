class Music < ActiveRecord::Base
  attr_accessible :user_picture, :user_id, :album_picture, :album_title, :album_description, :filename, :ip
  validates  :user_picture, :album_picture, :album_title, :album_description, :filename,
  			:presence => true

  belongs_to :user
end