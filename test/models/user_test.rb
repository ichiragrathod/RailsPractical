require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Email id must be exist" do
    assert_not User.new(password: 123456).save
  end

  test "Password must be exist" do
    assert_not User.new(email: "chirag@gmail.com").save
  end
end
