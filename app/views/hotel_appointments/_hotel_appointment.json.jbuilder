json.name appointment.company.name
json.checkout_at l(appointment.end_date_local_time, format: :date)
json.checkin_at l(appointment.scheduled_at_local_time, format: :date)
json.stay_time t('appointment.stay_time', count: (appointment.end_date.to_date - appointment.scheduled_at.to_date).to_i)
json.latitude appointment.company.latitude.to_f
json.longitude appointment.company.longitude.to_f
json.address appointment.company.address
json.phone appointment.company.phone
json.room appointment.hotel_reservation.room
json.notes appointment.hotel_reservation.notes
json.confirmation_code appointment.hotel_reservation.confirmation_code
json.site appointment.company.site
