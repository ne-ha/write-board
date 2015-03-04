require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "adding notes", :type=> :feature, :js => true do

  before :each do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it "should be able to create notes" do
    visit root_path
    click_link "Add Notes"
    within(".new") do
      fill_in  'Title', :with => 'abcd'
      fill_in  'Description', :with => 'secret'
    end
    click_button "Save"
    expect(page).to have_content "Note created successfully."
    click_link "Delete"
    page.accept_confirm
    expect(page).to have_content "Note deleted successfully."
  end
end


