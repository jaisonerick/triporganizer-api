json.company_name appointment.company.name
json.from appointment.from
json.to appointment.to
json.flight_number appointment.flight_number
json.arrival_gate appointment.arrival_gate
json.arrival_platform appointment.arrival_platform
json.departure_gate appointment.departure_gate
json.departure_platform appointment.departure_platform

json.arrival plane_arrival_date(appointment.scheduled_at_local_time, appointment.end_date_local_time)
json.departure_date l(appointment.scheduled_at_local_time, format: :medium)
json.arrival_date l(appointment.end_date_local_time, format: :medium)
json.seat appointment.flight_ticket.seat
json.details appointment.flight_ticket.details
json.confirmation_number appointment.flight_ticket.confirmation_number


