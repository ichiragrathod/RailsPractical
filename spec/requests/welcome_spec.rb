require 'rails_helper'

RSpec.describe WelcomeController do
  context "GET #index" do
    it "returns a success response" do
      get root_path
      expect(response).to render_template("index")
    end
  end
end
