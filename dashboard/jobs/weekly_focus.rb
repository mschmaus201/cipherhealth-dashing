require 'httparty'

SCHEDULER.every '2s', :first_in => 0 do |job|
  weekly_focus_get_request = HTTParty.get('http://localhost:9393/weekly_focus.json')
  weekly_focus = weekly_focus_get_request.parsed_response

  send_event('buzzwords', { items: weekly_focus.values })
end
