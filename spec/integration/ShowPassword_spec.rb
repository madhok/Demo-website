require "spec_helper"

describe "Show Password" do

  let(:user) { FactoryGirl.create(:user) }

  describe "show page" do
    it "should show pw" do
      visit signin_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "Sign in"
      page.should have_selector('h1',text: 'Welcome to Job Portal')
      page.should have_selector('#div_hello',text: '')
      xhr :post, url_for(controller: "users", action: "say_when", id: user.id)
      response.body.should include("password")
      response.body.should include(user.password)
    end
  end
end