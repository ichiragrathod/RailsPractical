class AddDataToBooks < ActiveRecord::Migration[7.0]
  def change
    Book.create(name: "Ruby on Rails Tutorial: Learn Web Development ",price: "999.0", author_id: 1)
    Book.create(name: "Introduction to Algorithms",price: "1056.0", author_id: 1)
    Book.create(name: "The Pragmatic Programmer",price: "750.0", author_id: 2)
    Book.create(name: "Agile Web Development with Rails 6",price: "600.0", author_id: 2)
    Book.create(name: "Basic Of Computer Hardware and Software",price: "560.0", author_id: 3)
    Book.create(name: "Programming With Ruby",price: "800.0", author_id: 3)
  end
end
