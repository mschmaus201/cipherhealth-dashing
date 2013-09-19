require 'httparty'

SCHEDULER.every '2s', :first_in => 0 do |job|
  weekly_focus_get_request = HTTParty.get('http://localhost:9393/weekly_focus.json')
  weekly_focus = weekly_focus_get_request.parsed_response["weekly_focus"]

  send_event('weekly_focus', { text: weekly_focus })
end
