require 'pi_piper'
include PiPiper

green_pin = PiPiper::Pin.new( :pin => 17, :direction => :out)
red_pin = PiPiper::Pin.new( :pin => 27, :direction => :out)
# button = PiPiper::Pin.new( :pin => 2, :direction => :in)

watch :pin=> 2 do
   puts "Pin changed from #{last_value} to #{value}"
end

=begin 
after( :pin => 2, :goes => :low) do
   puts "button pressed"
   puts "now starting sequence"
   puts "green pin going on"
   green_pin.on
   sleep 3
   puts "red pin going on"
   red_pin.on
   sleep 3
   puts "green pin going off"
   green_pin.off
   puts green_pin.read
   sleep 3
   puts "red pin going off"
   red_pin.off
end

=end

PiPiper.wait

