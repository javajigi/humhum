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
  	assert !music.save, "Save music without user picture"
  end

  test "do not save without user name" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	music.filename = "filename"
  	assert !music.save, "Save music without user name"
  end

  test "do not save without album picture" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	music.filename = "filename"
  	assert !music.save, "Save music without album picture"
  end

  test "do not save without album title" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_description = "album_description"
  	music.filename = "filename"
  	assert !music.save, "Save music without album title"
  end

  test "do not save without album description" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.filename = "filename"
  	assert !music.save, "Save music without album description"
  end

  test "do not save without filename" do
  	music = Music.new
  	music.user_picture = "user_picture"
  	music.user_name = "user_name"
  	music.album_picture = "album_picture"
  	music.album_title = "album_title"
  	music.album_description = "album_description"
  	assert !music.save, "Save music without filename"
  end

end




