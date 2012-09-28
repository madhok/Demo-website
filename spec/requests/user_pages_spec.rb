require "spec_helper"

describe "User pages" do

  subject { page }

  describe "show page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: 'Welcome to Job Portal') }
    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('h3', text: user.email) }
    it { should have_selector('h3', text: user.skills) }
    it { should have_selector('h3', text: 'Experience') }

  end

  describe "create page" do

    before { visit new_user_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Madhok User"
        fill_in "Email",        with: "user@email.com"
        fill_in "Password",     with: "123456"
        fill_in "Skills",       with: "C,C++"
        fill_in "Experience",   with: "5"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end