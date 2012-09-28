require "spec_helper"

describe "sessions page" do

   describe "Home page" do

      it "should have the content Sign in" do
        visit '/signin'
        page.should have_content('Sign in')
      end

      it "should have Sign in Button" do
        expect { click_button Signin }
      end

      it "should  have email label" do
        visit '/signin'
        page.should have_content('Email')
      end
      it "should  have password label" do
        visit '/signin'
        page.should have_content('Password')
      end
   end



end