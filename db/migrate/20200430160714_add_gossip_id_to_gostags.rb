class AddGossipIdToGostags < ActiveRecord::Migration[5.2]
  def change
    add_reference :gostags, :gossip, foreign_key: true
  end
end
