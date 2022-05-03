require 'rails_helper'

RSpec.describe User, type: :model do 
  context 'validation test' do
    it 'ensures user email presence' do
      user = User.new(password:"123456").save
      expect(user).to eq(false) 
    end

    it 'ensures user password presence' do
      user = User.new(email:"chirag@gmail.com").save
      expect(user).to eq(false) 
    end
  end
end
