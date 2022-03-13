class AddDataToAuthor < ActiveRecord::Migration[7.0]
  def change
    Author.create(first_name:"Chirag", last_name: "Rathod", date_of_birth: "Fri, 19 Aug 2001", email: "chirag@gmail.com")
    Author.create(first_name: "Deep", last_name: "Joshi", date_of_birth: "Sat, 10 Jan 2002", email: "deep@gmail.com")     
    Author.create(first_name:"Manish", last_name: "Soni", date_of_birth: "Fri, 23 Jan 2001", email: "manish@gmail.com")
    Author.create(first_name: "Hitesh", last_name: "Patel", date_of_birth: "Sat, 15 Aug 2001", email: "hitesh@gmail.com")   
  end
end
