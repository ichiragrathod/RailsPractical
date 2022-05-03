require 'rails_helper'

RSpec.describe User, type: :request do
  it "should get new path" do
    get new_user_registration_path
    expect(response).to be_successful  
  end

  it "should get login path" do
    get new_user_session_path
    expect(response).to be_successful  
  end

  it "should logout" do
    delete destroy_user_session_path
    expect(response.status).to eq(302)
  end
end
