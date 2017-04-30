json.title appointment.name
json.description appointment.description

json.company_name appointment.company.name
json.from appointment.from
json.to appointment.to
json.address appointment.company.address

json.departure_date l(appointment.scheduled_at, format: :medium)
json.arrival_date l(appointment.end_date, format: :medium)

json.arrival plane_arrival_date(appointment.scheduled_at, appointment.end_date)
