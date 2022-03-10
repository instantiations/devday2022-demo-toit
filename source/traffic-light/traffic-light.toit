import gpio

class TrafficLight:
  redLight := gpio.Pin 14 --output 
  yellowLight := gpio.Pin 27 --output 
  greenLight := gpio.Pin 12 --output 

  ON ::= 1
  OFF ::= 0  

  turnAllLightsOn: turnAllLights ON
  turnAllLightsOff: turnAllLights OFF

  turnAllLights number:
    allLights := [redLight, yellowLight, greenLight]
    allLights.do: it.set number

  printAllLights:
    print "Red: $redLight"
    print "Yellow: $yellowLight"
    print "Green: $greenLight"

  runSequence:
    turnAllLightsOff
    redLight.set ON
    sleep --ms=2000
    yellowLight.set ON
    sleep --ms=1000
    redLight.set OFF
    yellowLight.set OFF
    greenLight.set ON
    sleep --ms=2000
    greenLight.set OFF
    yellowLight.set ON
    sleep --ms=1000
    yellowLight.set OFF

main:
  trafficLight := TrafficLight
  2.repeat:
    trafficLight.runSequence

