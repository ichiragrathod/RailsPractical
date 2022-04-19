class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :hobbies, :string, array: true
  end
end
