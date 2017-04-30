json.upcoming @upcoming do |trip|
  json.id trip.id
  json.upcoming true
  json.name trip.name
  json.dates date_range(trip.starts_at, trip.ends_at)
  json.description trip.description
  json.image trip.image
  json.promo trip.promo_url

  json.sponsors trip.sponsors do |sponsor|
    json.id sponsor.id
    json.name sponsor.name
    json.image sponsor.image_url
  end
end

json.trips @trips do |(trip, trip_documents, trip_dates)|
  json.id trip.id
  json.name trip.name
  json.dates date_range(trip.starts_at, trip.ends_at)
  json.description trip.description
  json.image trip.image

  json.sponsors trip.sponsors do |sponsor|
    json.id sponsor.id
    json.name sponsor.name
    json.image sponsor.image_url
  end

  json.documents trip_documents do |document|
    json.key document.key
    json.type document.type
    json.title document.title
    json.url document.url
    json.display_type document.display_type
    json.uploadable document.uploadable
  end

  json.trip_dates trip_dates do |date, appointments|
    json.date l(date, format: :long)

    json.appointments appointments do |appointment|
      json.id appointment.id
      json.last(appointment.milestones.size == 0 && appointment == appointments.last)
      json.upcoming(appointment.scheduled_at > Time.zone.now)
      json.medium appointment.medium
      json.medium_image image_url(appointment.medium_image)
      json.time l(appointment.scheduled_at, format: :time)
      json.date l(appointment.scheduled_at, format: :simple_date)

      json.type appointment.type

      json.details do
        json.partial! appointment.to_partial_path, appointment: appointment
      end

      json.milestones appointment.milestones.each_with_index.to_a do |(milestone, index)|
        json.id milestone.id
        json.last(!(index + 1 == appointment.milestones.size && appointment != appointments.last))
        json.description milestone.description
      end
    end
  end
end
