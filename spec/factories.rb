FactoryGirl.define do
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
  factory :boarding_ticket do
    registration nil
    flight nil
    flight_class "MyString"
    seat "MyString"
    qr_code "MyText"
    notes "MyText"
  end
  factory :flight do
    airline nil
    departure_at "2017-02-27 13:13:01"
    arrives_at "2017-02-27 13:13:01"
    flight_number "MyString"
    origin "MyString"
    destination "MyString"
    boarding_gate "MyString"
    phone "MyString"
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
  factory :airline do
    openflight_id ""
    name "MyString"
    name_alias "MyString"
    iata "MyString"
    icao "MyString"
    callsign "MyString"
    country "MyString"
    active false
  end

  factory :admin do
    
  end
  factory :user do
    
  end
end
