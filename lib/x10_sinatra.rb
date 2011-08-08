#!/usr/bin/env ruby
#
# X10 library interface
#
require 'rubygems'
require 'x10/cm17a'

class X10Sinatra
    def initialize(device)
        @device = X10.device(device)
    end

    def on
        @device.on
    end

    def off
        @device.off
    end

    def step_up
        @device.step(5)
    end

    def step_down
        @device.step(-5)
    end
end
