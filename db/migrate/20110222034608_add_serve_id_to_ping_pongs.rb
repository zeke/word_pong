class AddServeIdToPingPongs < ActiveRecord::Migration
  def self.up
    add_column :ping_pongs, :serve_id, :integer
  end

  def self.down
    remove_column :ping_pongs, :serve_id
  end
end
