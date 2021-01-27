#include <Wire.h>

SYSTEM_MODE (MANUAL);

#include "SparkFunBME280.h"
BME280 mySensor;

unsigned long sampleNumber = 0;

void setup()
{
  Serial.begin(9600);

  Wire.begin();

  if (mySensor.beginI2C() == false) //Begin communication over I2C
  {
    Serial.println("The sensor did not respond. Please check wiring.");
    while(1); //Freeze
  }

	//Build a first-row of column headers
  Serial.print("SampleNumber,");
  Serial.print("Time(ms),");
	Serial.print("T(deg C),");
	Serial.print("T(deg F),");
	Serial.print("P(Pa),");
	Serial.print("Alt(m),");
	Serial.print("Alt(ft),");
	Serial.print("%RH");
	Serial.println("");
}

void loop()
{
	//Print each row in the loop
	//Start with temperature, as that data is needed for accurate compensation.
	//Reading the temperature updates the compensators of the other functions
	//in the background.
  Serial.print(sampleNumber);
  Serial.print(",");
	Serial.print(millis());
	Serial.print(",");
	Serial.print(mySensor.readTempC(), 2);
	Serial.print(",");
	Serial.print(mySensor.readTempF(), 3);
	Serial.print(",");
	Serial.print(mySensor.readFloatPressure(), 0);
	Serial.print(",");
	Serial.print(mySensor.readFloatAltitudeMeters(), 3);
	Serial.print(",");
	Serial.print(mySensor.readFloatAltitudeFeet(), 3);
	Serial.print(",");
	Serial.print(mySensor.readFloatHumidity(), 0);
	Serial.println();
	
	sampleNumber++;
	
	delay(50);
}
