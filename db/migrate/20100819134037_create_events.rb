class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.text :title,          :null => false
      t.text :body,           :null => false
      t.datetime :start_time, :null => false
      t.datetime :end_time,   :null => false
      t.timestamps
    end
    
    add_index(:events, :title, :unique => true)
  end

  def self.down
    drop_table :events
  end
end
