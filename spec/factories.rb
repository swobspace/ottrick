FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  factory :otrs_queue, class: Ottrick::OtrsQueue do
    name
  end

end
