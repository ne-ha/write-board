# require 'rails_helper'

# include Warden::Test::Helpers
# Warden.test_mode!

# describe "adding notes", :type=> :feature, :js => true do

#   before :each do
#     User.destroy_all
#     user1 = FactoryGirl.create(:user, email: "t@testa.com")
#     user2 = FactoryGirl.create(:user, email: "t@tesa.om")
#     user = FactoryGirl.create(:user)
#     login_as(user, :scope => :user)
#   end

#   it "should be able to create notes" do
#     visit root_path
#     click_link "Add Notes"
#     within(".new") do
#       fill_in  'Title', :with => 'abcd'
#       fill_in  'Description', :with => 'secret'
#     end
#     click_button "Save"
#     expect(page).to have_content "Note created successfully."
#     click_link "Share"
#     binding.pry
#     find(:css, "#note_user_ids_59").set(true)
#     click_button "Share"
#     expect(page).to have_content "Note is shared with other users."
#   end
# end