/*
@author Yew Journ Chan
 - this program will draw a circle and change the size of the circle by adjusting the potentiometer.
 - hitting the switch will also cause the background color to change
 */

// function to import the serial library to communicate with Arduino Bread Board
import processing.serial.*;

//initializinng a variable named 'myPort' for serial communication
Serial myPort;

// data to come in from data fields
String [] data;
int switchValue = 0; 
int potValue = 1;

//change to appropriate index in the serial list
int serialIndex=0;

//animate ball
int miniPotValue = 0;
int maxPotValue = 1023;
int minBallSize = 0;
int maxBallSize = 50;


int randomRed = int(random(255));
int randomGreen = int(random(255));
int randomBlue = int(random(255));

void setup () {
  size(1000,1000);
  print(Serial.list()); //list all the available serial ports
  myPort = new Serial (this, Serial.list() [serialIndex], 115200); //set the com port and the baud rate according to the Arduino IDE
}

//call this to receive data
void checkSerial() {
  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();
    
    print(inBuffer);
    inBuffer = (trim(inBuffer)); //this will remove the end of linen from String and cast it to an integer
    data = split(inBuffer, ',');
    switchValue = int(data[0]);
    potValue = int(data[1]);
  }
}

void draw() { //this function will change the background to red
  checkSerial();
  drawBackground();
  moveBall();
}

void drawBackground() { // if input is 1 (when button on ESP32 is pressed),it will change the background color
if (switchValue == 1) {
  randomRed++;
  randomGreen++;
  randomBlue++;
  background(randomRed, randomGreen, randomBlue);
} else {
  background(0);
  randomRed = int(random(255));
  randomGreen = int(random(255));
  randomBlue = int(random(255));
  }
}

void moveBall() { //function to move the ball left & right using potValue to adjust speed
  fill(255, 0, 277);
  float size = map(PotValue, minPotValue, maxPotValue, minBallSize, maxBallSize); //receive value from potentiometer
}
  size = pow(size, 2); //changes size exponnentially
  fill(169, 204, 277);
  ellipse(400, 400, size, size);
  }
}

  
