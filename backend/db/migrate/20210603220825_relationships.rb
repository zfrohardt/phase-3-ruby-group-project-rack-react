class Relationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :character_id
      t.integer :spell_id
    end
  end
end
