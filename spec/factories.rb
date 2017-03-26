FactoryGirl.define do
  factory :flight_ticket do
    flight_appointment nil
    seat "MyString"
    details "MyText"
  end
  factory :milestone do
    appointment nil
    description "MyString"
    order 1
  end
  factory :appointment do
    trip nil
    type ""
    description "MyText"
    scheduled_at "2017-03-19 19:39:28"
    details ""
  end
  factory :transit do
    registration nil
    transport nil
    specifics ""
  end
  factory :transport do
    trip nil
    departure_at "2017-02-28 18:52:33"
    arrives_at "2017-02-28 18:52:33"
    origin "MyString"
    destination "MyString"
    attachment_url "MyString"
    specifics ""
  end
  factory :place do
    name "MyString"
    description "MyString"
    google_places_id "MyString"
    latitude "9.99"
    longitude "9.99"
    picture_url "MyString"
    address "MyString"
  end
  factory :company do
    name "MyString"
    description "MyString"
    address "MyString"
    phone "MyString"
    company_type 1
  end
  factory :event do
    destination nil
    name "MyString"
    description "MyString"
    starts_at "2017-02-28 17:47:30"
    ends_at "2017-02-28 17:47:30"
    type ""
  end
  factory :hotel_reservation do
    registration nil
    destination nil
    room "MyString"
    notes "MyText"
  end
  factory :registration do
    trip nil
    user nil
  end
  factory :destination do
    name "MyString"
    description "MyString"
    starts_at "2017-02-26 22:23:06"
    ends_at "2017-02-26 22:23:06"
    address "MyString"
    latitude "9.99"
    longitude "9.99"
    google_places_id "MyString"
    picture_url "MyString"
    order 1
    trip nil
    hotel nil
  end
  factory :trip do
    name "MyString"
    description "MyString"
    starts_at "2017-02-26"
    ends_at "2017-02-26"
  end
  factory :hotel do
    name "MyString"
    address "MyString"
    city "MyString"
    country "MyString"
    latitude "MyString"
    longitude "MyString"
    phone "MyString"
    email "MyString"
    google_places_id "MyString"
  end

  factory :admin do
    
  end
  factory :user do
    
  end
end
