class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.date :posted
      t.references :album
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
