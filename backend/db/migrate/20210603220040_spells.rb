class Spells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :description
      t.string :school
      t.string :components
      t.boolean :user_created
    end
  end
end
