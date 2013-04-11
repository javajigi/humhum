class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.text :description
      t.string :filename
      t.string :artist

      t.timestamps
    end
  end
end
