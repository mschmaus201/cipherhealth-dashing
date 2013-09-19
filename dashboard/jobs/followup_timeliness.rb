require 'httparty'

SCHEDULER.every '5s', :first_in => 0 do |job|
  followup_timeliness_get_request = HTTParty.get('http://localhost:9393/followup_timeliness.json')
  time_to_reach = followup_timeliness_get_request.parsed_response["time_to_reach"]
  time_to_close = followup_timeliness_get_request.parsed_response["time_to_close"]
end