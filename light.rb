require 'pi_piper'
include PiPiper

$green_pin = PiPiper::Pin.new( :pin => 17, :direction => :out)
$red_pin = PiPiper::Pin.new( :pin => 27, :direction => :out)
$button = PiPiper::Pin.new( :pin =>2, :direction => :in)
$amber_pin = PiPiper::Pin.new( :pin => 10, :direction => :out)
$ped_green = PiPiper::Pin.new( :pin => 15, :direction => :out)
$ped_red = PiPiper::Pin.new( :pin => 18, :direction => :out)

after( :pin => 2, :goes => :low) do  # start crossing sequence
  $green_pin.off
  $amber_pin.on
  sleep 2
  $amber_pin.off
  $red_pin.on
  sleep 0.5
  $ped_red.off
  $ped_green.on
  sleep 5
  $red_pin.off
  
  5.times do    #flashing lights
    $amber_pin.on
    $ped_green.on
    sleep 0.5
    $amber_pin.off
    $ped_green.off
    sleep 0.5
  end
  $ped_red.on
  $green_pin.on
  
     
end

def starting_position   # make sure all the leds are in the right position
  $ped_red.on
  $green_pin.on
  $amber_pin.off
  $red_pin.off
  $ped_green.off
end

starting_position
PiPiper.wait

