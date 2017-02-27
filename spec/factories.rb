FactoryGirl.define do
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
