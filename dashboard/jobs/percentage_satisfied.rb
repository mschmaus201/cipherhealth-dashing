require 'httparty'

SCHEDULER.every '5s', :first_in => 0 do |job|
  percentage_satisfied_get_request = HTTParty.get('http://localhost:9393/percentage_satisfied.json')
  percentage_satisfied1 = percentage_satisfied_get_request.parsed_response["percentage_satisfied1"]
  percentage_satisfied2 = percentage_satisfied_get_request.parsed_response["percentage_satisfied2"]

  send_event('percentage_satisfied1',   { value: percentage_satisfied1 })
  send_event('percentage_satisfied2',   { value: percentage_satisfied2 })
end