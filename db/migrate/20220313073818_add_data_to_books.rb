class AddDataToBooks < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        Book.create(name: "Ruby on Rails Tutorial: Learn Web Development ",price: "999.0", author_id: 1)
        Book.create(name: "Introduction to Algorithms",price: "1056.0", author_id: 1)
        Book.create(name: "The Pragmatic Programmer",price: "750.0", author_id: 2)
        Book.create(name: "Agile Web Development with Rails 6",price: "600.0", author_id: 2)
        Book.create(name: "Basic Of Computer Hardware and Software",price: "560.0", author_id: 3)
        Book.create(name: "Programming With Ruby",price: "800.0", author_id: 3)
      end

      dir.down do
        Book.find_by(name:"Ruby on Rails Tutorial: Learn Web Development ").destroy
        Book.find_by(name:"Introduction to Algorithms").destroy
        Book.find_by(name:"The Pragmatic Programmer").destroy
        Book.find_by(name:"Agile Web Development with Rails 6").destroy
        Book.find_by(name:"Basic Of Computer Hardware and Software").destroy
        Book.find_by(name:"Programming With Ruby").destroy
      end

    end

  end
end
