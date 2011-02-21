class RenamePlayModeToMode < ActiveRecord::Migration
  def self.up
    rename_column :ping_pongs, :play_mode, :mode
  end

  def self.down
    rename_column :ping_pongs, :mode, :play_mode
  end
end
