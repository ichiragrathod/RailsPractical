class AddPolymorphicAttrsToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :imageable_type, :string
    add_column :images, :imageable_id, :integer
  end
end
