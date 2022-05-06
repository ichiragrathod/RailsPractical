class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, :subcription, :subscription_email, presence: true
end
