class CreateGossipsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips_tags do |t|
      t.belongs_to :gossips, index: true
      t.belongs_to :tags, index: true
      t.timestamps
    end
  end
end
