class RemovePrecedentIdFromPingPongs < ActiveRecord::Migration
  def self.up
    remove_column :ping_pongs, :precedent_id
  end

  def self.down
    add_column :ping_pongs, :precedent_id, :integer
  end
end
