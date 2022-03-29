class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.float :capacity
      t.boolean :is_active
      t.integer :status
      t.timestamps
    end
  end
end
