require 'httparty'

SCHEDULER.every '5s', :first_in => 0 do |job|
  reach_get_request = HTTParty.get('http://localhost:9393/reach.json')
  reach_percentage = reach_get_request.parsed_response
  # reach_percentage = reach_get_request.parsed_response["reach_percentage"]

  send_event('reach',   { value: reach_percentage["reach_percentage"] })
end