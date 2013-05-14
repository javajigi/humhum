class Music < ActiveRecord::Base
  attr_accessible :user_picture, :user_name, :album_picture, :album_title, :album_description, :filename, :ip

  validates :album_title, :album_picture, :album_description, :user_name,
  			:presence => true

end
