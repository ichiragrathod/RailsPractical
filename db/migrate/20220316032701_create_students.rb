class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :department
      t.boolean :terms_of_usage
      t.timestamps
    end
  end
end
