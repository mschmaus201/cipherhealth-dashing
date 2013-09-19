require 'httparty'

reach_percentage = 0

SCHEDULER.every '5s', :first_in => 0 do |job|
  last_reach = reach_percentage
  reach_get_request = HTTParty.get('http://localhost:9393/reach.json')
  reach_percentage = reach_get_request.parsed_response["reach_percentage"]

  send_event('reach', { current: reach_percentage, last: last_reach })
end