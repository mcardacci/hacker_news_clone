require 'rails_helper'

describe SessionsController do
  describe "login password validation" do
    let!(:user)  { User.create(:name => "Bob", :password => "1234", :email => "monkeychicken@asdf.com") }
    logged_in
    it "redirects to user profile" do
      post :create, { name: "Bob", password: "1234" }
      expect(response).to redirect_to(user)
    end
    it "redirects to login upon unsuccessful form validation" do
      post :create, { name: "BoBBB", password: "1234"}
      expect(response).to redirect_to(login_path)
    end
  end

  describe "session is deleted" do
    logged_in
    it "redirects to login_path" do
      post :create, {name: "Bob", password: "1234" }
      expect(session[:user_id]).to eq(user.id)
      post :delete
      expect(session[:user_id]).to eq(nil)
      expect(response).to redirect_to(root_path)
    end
  end
end

