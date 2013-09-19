require 'rubygems'
require 'sinatra'
require 'json'

get '/reach.json' do
  content_type :json
  { :reach_percentage => "#{(rand(20)+60)}" }.to_json
end

get '/percentage_satisfied.json' do
  content_type :json
  { :percentage_satisfied1 => "#{(rand(20)+100)}", :percentage_satisfied2 => "#{(rand(30)+40)}" }.to_json
end

get '/weekly_focus.json' do
  set = ["Meds", "Sat", "Discharge", "FU Appt"]
  content_type :json
  { :weekly_focus => "#{set[rand(3)-1]}" }.to_json
end

get '/followup_timeliness.json' do
  content_type :json
  { :time_to_reach => "#{(rand(10) + 10)}", :time_to_close => "#{(rand(10))}" }.to_json
end
