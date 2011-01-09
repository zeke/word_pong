class CreatePingPongs < ActiveRecord::Migration
  def self.up
    create_table :ping_pongs do |t|
      t.integer :precedent_id
      t.string :ping
      t.string :pong
      t.string :play_mode

      t.timestamps
    end
  end

  def self.down
    drop_table :ping_pongs
  end
end
