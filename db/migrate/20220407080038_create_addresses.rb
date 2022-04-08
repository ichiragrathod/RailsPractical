class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :user_address
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
