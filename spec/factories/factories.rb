FactoryGirl.define do 
  factory :user do 
    email "test@example.com"
    password "secretpassword"
    password_confirmation "secretpassword"
  end

  factory :note do
    title "test"
    description "this is jus a test"
  end
end