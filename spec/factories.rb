FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  factory :otrs_queue, class: Ottrick::OtrsQueue do
    name
  end

  factory :task do
    subject "mySubject"
    message "yet another message"
  end

  factory :ticket, class: Ottrick::Ticket do
    subject "Just a Ticket"
    text    "should be a concrete description"
    sender  "tester@example.com"
    otrs_queue_id 1
    # -- FactoryGirl.create(:ticket)
    after(:build) do |ticket| 
      ticket.class.skip_callback(:create, :after, :create_otrs_ticket)
    end
    # -- FactoryGirl.create(:ticket, :with_after_save_callback)
    trait :with_after_save_callback do
      after(:build) do |ticket| 
        ticket.class.set_callback(:create, :after, :create_otrs_ticket)
      end
    end
  end


end
