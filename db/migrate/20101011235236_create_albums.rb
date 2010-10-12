class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.string :label
      t.date :release
      t.references :artist
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
