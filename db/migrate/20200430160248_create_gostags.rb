class CreateGostags < ActiveRecord::Migration[5.2]
  def change
    create_table :gostags do |t|

      t.timestamps
    end
  end
end
