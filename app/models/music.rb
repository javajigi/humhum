class Music < ActiveRecord::Base
  attr_accessible :user_picture, :user_name, :album_picture, :album_title, :album_description, :filename, :ip

  validates  :user_picture, :user_name, :album_picture, :album_title, :album_description, :filename,
  			:presence => true

end
