json.name appointment.name
json.description appointment.description
json.long_description appointment.long_description.presence || appointment.description

json.address appointment.company.address
json.image appointment.company.picture_url
json.phone appointment.company.phone
json.site appointment.company.site
json.latitude appointment.company.latitude.to_f
json.longitude appointment.company.longitude.to_f
