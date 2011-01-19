class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.text :description
      t.text :title
      t.date :date
      t.text :url
      t.integer :event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
