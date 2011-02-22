class AddIndexesToPingPongs < ActiveRecord::Migration
  def self.up
    add_index :ping_pongs, :serve_id
    add_index :ping_pongs, :ping
    add_index :ping_pongs, :pong
    add_index :ping_pongs, :mode
  end

  def self.down
    remove_index :ping_pongs, :serve_id
    remove_index :ping_pongs, :ping
    remove_index :ping_pongs, :pong
    remove_index :ping_pongs, :mode
  end
end
