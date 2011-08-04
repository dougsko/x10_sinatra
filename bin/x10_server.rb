#!/usr/bin/env ruby
#
# X10 sinatra server
#
require 'rubygems'
require 'sinatra'
require 'lib/x10_sinatra'

get '/' do
    "<form method='POST' action='/x10'>" +
        "<input type='radio' name='device_num' value='1' checked />1<br />" +
        "<input type='radio' name='device_num' value='2' />2<br />" +
        "<input type='radio' name='device_num' value='3' />3<br />" +
        "<input type='radio' name='device_num' value='4' />4<br />" +
        "<input type='radio' name='device_num' value='5' />5<br />" +
        "<input type='radio' name='device_num' value='6' />6<br />" +
        "<input type='radio' name='device_num' value='7' />7<br />" +
        "<input type='radio' name='device_num' value='8' />8<br />" +
        "<select name='device_letter'>" +
            "<option value='a'>A</option>" +
            "<option value='b'>B</option>" +
            "<option value='c'>C</option>" +
            "<option value='d'>D</option>" +
            "<option value='e'>E</option>" +
            "<option value='f'>F</option>" +
        "</select><br />" +
        "<input type='submit' name='command' value='on' />" +
        "<input type='submit' name='command' value='off' />" +
        "<input type='submit' name='command' value='step up' />" +
        "<input type='submit' name='command' value='step down' />" +
    "</form>"
end

post '/x10' do
    device = params['device_letter'] + params['device_num']
    x10sinatra = X10Sinatra.new(device)

    case params['command']
    when "on"
        x10sinatra.on
    when "off"
        x10sinatra.off
    when "step up"
        x10sinatra.step_up
    when "step down"
        x10sinatra.step_down
    end
    redirect ("/")
end
        