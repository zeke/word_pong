class CreatePronunciations < ActiveRecord::Migration
  def self.up
    create_table :pronunciations do |t|
      t.string :word
      t.string :transcription
      t.timestamps
    end
    add_index :pronunciations, :word
    add_index :pronunciations, :transcription
  end

  def self.down
    drop_table :pronunciations
  end
end
