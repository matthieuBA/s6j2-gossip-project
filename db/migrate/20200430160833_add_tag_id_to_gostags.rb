class AddTagIdToGostags < ActiveRecord::Migration[5.2]
  def change
    add_reference :gostags, :tag, foreign_key: true
  end
end
