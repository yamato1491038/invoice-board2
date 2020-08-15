class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :name, null: false, unique: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end
