json.company_name appointment.company.name
json.from appointment.from
json.to appointment.to
json.ticket appointment.train_ticket.ticket
json.info appointment.train_ticket.info
json.address appointment.address

json.departure_date l(appointment.scheduled_at_local_time, format: :medium)
json.arrival_date l(appointment.end_date_local_time, format: :medium)

json.arrival plane_arrival_date(appointment.scheduled_at_local_time, appointment.end_date_local_time)
