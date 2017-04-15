json.from appointment.from
json.to appointment.to
json.flight_number appointment.flight_number
json.gate appointment.gate
json.arrival plane_arrival_date(appointment.scheduled_at, appointment.end_date)
json.seat appointment.flight_ticket.seat
json.details appointment.flight_ticket.details


