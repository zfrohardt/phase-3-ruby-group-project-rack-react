class Spells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :description
      t.string :school
      t.string :components
    end
  end
end
