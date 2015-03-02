
FactoryGirl.define do
  factory :task do
    sequence(:description) {|n| "Task #{n}"}
    due_date  Time.now
    completed true
  end
end
