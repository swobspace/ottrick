FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  factory :otrs_queue, class: Ottrick::OtrsQueue do
    name
  end

  factory :ticket, class: Ottrick::Ticket do
    subject "Just a Ticket"
    text    "should be a concrete description"
    sender  "tester@example.com"
    queue_id 1
  end


end
