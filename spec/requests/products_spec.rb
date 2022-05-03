require 'rails_helper'

RSpec.describe ProductsController do
  before do
    @user = FactoryBot.create(:user)
  end
  context "GET #index" do
    it "returns a success response" do
      sign_in @user
      get products_path
      expect(response).to render_template("index")
    end
  end
end
