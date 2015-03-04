require 'rails_helper'

describe "log in", :type=> :feature do

  before :each do
    user = FactoryGirl.create(:user)
  end

  it "sigin in " do
    visit "/users/sign_in"
    within("#new_user") do
      fill_in  'Email', :with => 'test@example.com'
      fill_in  'Password', :with => 'secretpassword'
    end
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
  
end