require 'test_helper'

class MusicTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "do not save without user picture" do
  	music = Music.new
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	music.filename = "filename"
  end

  test "do not save without user name" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	music.filename = "filename"
  end

  test "do not save without album picture" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	music.filename = "filename"
  end

  test "do not save without album title" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_description = "album_description"
  	music.filename = "filename"
  end

  test "do not save without album description" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.filename = "filename"
  end

  test "do not save without filename" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  end

end




