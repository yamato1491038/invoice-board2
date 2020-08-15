class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true
      t.integer :qty, null: false
      t.timestamps
    end
  end
end
