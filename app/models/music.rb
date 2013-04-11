class Music < ActiveRecord::Base
  attr_accessible :artist, :description, :filename, :title
end
