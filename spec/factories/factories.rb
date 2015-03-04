FactoryGirl.define do 
  factory :user do |f| 
    f.sequence :email do |e|
      "user#{e}@example.com"
    end
    f.password "secretpassword"
    f.password_confirmation "secretpassword"
  end

  factory :note do
    title "test"
    description "this is jus a test"
  end
end