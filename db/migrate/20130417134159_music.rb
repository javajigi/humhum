class Music < ActiveRecord::Migration
  def up
	create_table :musics do |t|
	  t.string :user_picture
	  t.string :user_name
	  t.string :album_picture
	  t.string :album_title
	  t.text :album_description
	  t.string :filename
	  t.string :ip

	  t.timestamps
	end
  end

  def down
    drop_table :musics
  end
end
