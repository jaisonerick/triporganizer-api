json.array! @trips do |(trip, trip_dates)|
  json.name trip.name
  json.dates date_range(trip.starts_at, trip.ends_at)
  json.description trip.description
  json.image trip.image

  json.trip_dates trip_dates do |date, appointments|
    json.date l(date, format: :long)

    json.appointments appointments do |appointment|
      json.last(appointment.milestones.size > 0 || appointment == appointments.last)
      json.upcoming(appointment.scheduled_at > Time.zone.now)
      json.medium appointment.medium
      json.medium_image image_url(appointment.medium_image)
      json.time l(appointment.scheduled_at, format: :time)

      json.type appointment.type

      json.details do
        json.partial! appointment.to_partial_path, appointment: appointment
      end

      json.milestones appointment.milestones.each_with_index.to_a do |(milestone, index)|
        json.last(!(index + 1 == appointment.milestones.size && appointment != appointments.last))
        json.description milestone.description
      end
    end
  end
end
