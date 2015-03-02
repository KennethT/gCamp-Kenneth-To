FactoryGirl.define do
  factory :user do
    first_name 'Bob'
    sequence(:last_name) {|n| "#{n}"}
    email {"#{first_name.downcase}#{last_name}@example.com"}
    password 'password'
  end
end
