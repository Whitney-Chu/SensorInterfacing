int trigPin = 1;
int echoPin = 2;

float distance_cm = 0.00;
float distance_in = 0.00;               
float duration = 0.00;                                   //Variable Declaration of parameters to measure

void setup() 
{
    pinMode(echoPin, INPUT);
    pinMode(trigPin, OUTPUT);      //Initialization of Pins on the arduino 
    Serial.begin(9600);            //begin Serial communication for the monitor
                                   // 9600 is the baud rate which specifies the speed at which a signal changes states. 
                                   // Specifies the speed of communication
}

void loop() 
{
  digitalWrite(trigPin, LOW);            
  delayMicroseconds(2);                    //Hold the trigger pin at low for 2 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);                   //Send out a pulse for 10 microseconds
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);       // Measure how long the echo pin is held HIGH. 
                                           //Time is meaured from the instant the signal leaves to when it returns. 

  distance_cm = MetresToCm(duration);     // Calls function that uses duration variable to find the distance. 
  distance_in = MetresToIn(duration);     //Functions can also convert distnace in metres to centimetres or inches. 

  Serial.print(distance_cm);              //Print distances in centimetres and inches repectively. 
  Serial.print(" cm ");
  Serial.print(distance_in);
  Serial.print(" in ");
  Serial.println();

  delay(10);
}
/***** 
 Below are the functions used to find the distnace given the time of travel of the 
 ultrasonic sensor. The function MetresToCm outputs the distance in mtres, while the cuntion
 MetresToIn outputs the distance in inches. 
*****/
float MetresToCm (float period_cm)
{
    float lengths_cm = 0.00;
    lengths_cm = period_cm* 0.0343/2;
    return lengths_cm;
}

float MetresToIn(float period_in)
{
  float lengths_in = 0.00;
  lengths_in = period_in*0.0343/(2*2.54);
  return lengths_in;
}
