/*Program: House
 Author:  Jeffrey Shi
 Date:    <Date  of  Completion>
 Notes:    Should  the  grader  (teacher,  peer,  etc.)  look  for  anything  specific?  
 Is  any  part  of  your  program  “broken”?
 Did  you  add  special  features?
 Did  you  adapt  code from  somewhere  else?
 
 Click the tree to enable commands.
 Click the chimney to turn on/off smoke.
 Click a window to turn on/off the light.
 
 Commands: (You can see all this by pressing the menu button on the top right.)
 freeze = freeze the animation
 resume = resume the animation. 
 snow = make the next weather snow
 rain = make the weather rain
 clear = make the sky clear
 reset = resets program to base. If you want to check weather, type the weather and then type reset.
 sonic = for when you gotta go fast
 sanic = for when you gotta go faster"
 
 
 You can use the numbers 1-9 to change the speed.
 */



int last = 0;
int last2 = 0;
int m = 0;
int xPos = -150;
int yPos = 150;
int xPos2 = -150;
int yPos2 = 150;
int phase = 0;
int speed = 1000;
int cloudPosX = -250;
int cloudPosY;
float bgr=153;
float bgg=217;
float bgb=234;
float darkness1;
float darkness2;
float darkness3;
float starX[] = new float [50];
float starY[] = new float [50];
float starSize[] = new float [50];
int weather; 
float snowX[] = new float [200];
float snowY[] = new float [200];
float snowSize[] = new float [200];
float rainX[] = new float [1500];
float rainY[] = new float [1500];
float rainSize[] = new float [1500];
float snowbackupX[] = new float [200];
float snowbackupY[] = new float [200];
float snowbackupSize[] = new float [200];
float rainbackupX[] = new float [1500];
float rainbackupY[] = new float [1500];
float rainbackupSize[] = new float [1500];
int realspeed;
int i = 0;
boolean weatherchosen = false;
int picX = 260;
int picY = 420;
PFont f;
PFont g;
String typing = " ";
String saved = " ";
int weatherdetermined = -1;
Boolean snowarrayset = false;
Boolean rainarrayset = false;
Boolean mckiearrayset = false;
Boolean textopen = false;
Boolean randweather = false;
Boolean resetpossnow = false;
int movingXPos = 100;
int movingYPos = 100;
float fenceX = 0;
int changeintime1 = 1;
int changeintime2 = 50;
int oldspeed;
int colorcheckr = 0;
int colorcheckg = 0;
int colorcheckb = 0;
color mousecolor;
boolean light1off = false;
boolean light2off = false;
boolean menu = false;
Boolean smoke = false;
Boolean textOpen = false;
int smokeY = 0;
int smokeY2 = 0;
int smokeY3 = 0;
int smokeY4 = 0;
int smokeY5 = 0;
int smoke2Y = 150;
int smoke2Y2 = 50;
int smoke2Y3 = -50;
int smoke2Y4 = -150;
int smoke2Y5 = -250;

void setup()
{
  size(800, 650);

  background(bgr, bgg, bgb);
  f = createFont("Arial", 16, true);
  g = createFont("Brittanic Bold", 24, true);
  weather = 0;
  phase = 0;
  weather = 1;
  for (int i = 0; i < 50; i++) {
  }

  smooth();
}
void draw()
{
  realspeed = 1100 - speed;
  noStroke();
  background(bgr - darkness1, bgg - darkness2, bgb - darkness3);
  if (phase==20) {
    for (int i = 0; i < 50; i++) {
      starX[i] = random(0, width);
      starY[i] = random(0, height);
      starSize[i] = random(0, 5); // Star
    }
  }
  if (phase>20) {
    for ( int i =0; i <50; i++) {
      fill(255, 255, 255);
      ellipse(starX[i], starY[i], starSize[i], starSize[i]); //Stars
    }
  }


  fill(255, 242, 0);
  rect(xPos, yPos -50, 100, 200); //sun1
  rect(xPos -50, yPos, 200, 100); //sun2

  fill(200, 200, 200);
  rect(xPos2, yPos2 -50, 100, 200); //moon1
  rect(xPos2 -50, yPos2, 200, 100); //moon2
  fill(255);
  rect(cloudPosX + 0, (cloudPosY*50), 150, 150); //cloud
  rect(cloudPosX + -50, 50 + (cloudPosY*50), 50, 50); //cloud
  rect(cloudPosX + 150, 50 + (cloudPosY*50), 50, 50); //cloud
  fill(200, 200, 200, 200);
  ellipse(325, 400-smokeY-smoke2Y, 50, 50); //Smoke
  ellipse(325, 400-smokeY2-smoke2Y2, 50, 50); //Smoke2
  ellipse(325, 400-smokeY3-smoke2Y3, 50, 50); //Smoke3
    ellipse(325, 400-smokeY4-smoke2Y4, 50, 50); //Smoke4
  ellipse(325, 400-smokeY5-smoke2Y5, 50, 50); //Smoke5
  fill(34, 177, 76);
  rect(0, 600, 800, 50); //grass
  fill(255, 255, 255);
  rect(50, 350, 350, 250); //house
  fill(255, 242, 100);
  rect(100, 400, 100, 100); //window1
  rect(250, 400, 100, 100); //window2




  m = millis()-last;
  if (millis() > last+speed) {
    last = millis();
    phase = phase + changeintime1;
  }
  if (millis() > last2+speed/2.5) {
    last2 = millis();
    cloudPosX = cloudPosX + changeintime2;
  }

  if (cloudPosX == 800) {
    cloudPosX = -200;
    cloudPosY = (int)random(3);
  }
  if (phase == 0) {
    xPos = -150;
    yPos = 200;
  } else if (phase == 1) {
    xPos = -100;
    yPos = 200;
    bgr=153;
    bgg=217;
    bgb=234;
    xPos2 = -1500;
    yPos2 = -1500;
  } else if (phase == 2) {
    xPos = -50;
    yPos = 150;
  } else if (phase == 3) {
    xPos = 0;
    yPos = 100;
  } else if (phase == 4) {
    xPos = 50;
    yPos = 100;
  } else if (phase == 5) {
    xPos = 100;
    yPos = 50;
  } else if (phase == 6) {
    xPos = 150;
    yPos = 0;
  } else if (phase == 7) {
    xPos = 200;
    yPos = 0;
  } else if (phase == 8) {
    xPos = 250;
    yPos = -50;
  } else if (phase == 9) {
    xPos = 300;
    yPos = -100;
  } else if (phase == 10) {
    xPos = 350;
    yPos = -100;
  } else if (phase == 11) {
    bgr=153 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 400;
    yPos = -100;
  } else if (phase == 12) {
    bgr=153 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 450;
    yPos = -50;
  } else if (phase == 13) {
    bgr=153 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 500;
    yPos = 0;
  } else if (phase == 14) {
    bgr=175 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 550;
    yPos = 0;
  } else if (phase == 15) {
    bgr=210 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 600;
    yPos = 50;
  } else if (phase == 16) {
    bgr=245 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    xPos = 650;
    yPos = 100;
  } else if (phase == 17) {
    bgr=240 - darkness1;
    bgg=160 - darkness2;
    bgb=150 - darkness3;
    xPos = 700;
    yPos = 100;
  } else if (phase == 18) {
    bgr=235 - darkness1;
    bgg=140 - darkness2;
    bgb=140 - darkness3;  
    xPos = 750;
    yPos = 150;
  } else if (phase == 19) {
    bgr=200 - darkness1;
    bgg=120 - darkness2;
    bgb=130 - darkness3;
    xPos = 800;
    yPos = 200;
  } else if (phase == 20) {
    bgr=130 - darkness1;
    bgg=100 - darkness2;
    bgb=120 - darkness3;
    xPos = 850;
    yPos = 200;
  } else if (phase == 21) {
    bgr=75 - darkness1;
    bgg=60 - darkness2;
    bgb=110 - darkness3;

    xPos2 = -150;
    yPos2 = 200;
  } else if (phase == 22) {
    bgr=35 - darkness1;
    bgg=44 - darkness2;
    bgb=100 - darkness3;
    xPos2 = -100;
    yPos2 = 200;
  } else if (phase == 23) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = -50;
    yPos2 = 150;
  } else if (phase == 24) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 0;
    yPos2 = 100;
  } else if (phase == 25) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 50;
    yPos2 = 100;
  } else if (phase == 26) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 100;
    yPos2 = 50;
  } else if (phase == 27) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 150;
    yPos2 = 0;
  } else if (phase == 28) {  
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 200;
    yPos2 = 0;
  } else if (phase == 29) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 250;
    yPos2 = -50;
  } else if (phase == 30) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 300;
    yPos2 = -100;
  } else if (phase == 31) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 350;
    yPos2 = -100;
  } else if (phase == 32) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 400;
    yPos2 = -100;
  } else if (phase == 33) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 450;
    yPos2 = -50;
  } else if (phase == 34) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 500;
    yPos2 = 0;
  } else if (phase == 35) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 550;
    yPos2 = 0;
  } else if (phase == 36) {
    bgr=0 - darkness1;
    bgg=24 - darkness2;
    bgb=72 - darkness3;
    xPos2 = 600;
    yPos2 = 50;
  } else if (phase == 37) {
    bgr=20 - darkness1;
    bgg=24 - darkness2;
    bgb=110 - darkness3;
    xPos2 = 650;
    yPos2 = 100;
  } else if (phase == 38) {
    bgr=40 - darkness1;
    bgg=60 - darkness2;
    bgb=130 - darkness3;
    xPos2 = 700;
    yPos2 = 100;
  } else if (phase == 39) {
    bgr=60 - darkness1;
    bgg=100 - darkness2;
    bgb=150 - darkness3;
    xPos2 = 750;
    yPos2 = 150;
  } else if (phase == 40) {
    bgr=80 - darkness1;
    bgg=140 - darkness2;
    bgb=170 - darkness3;
    xPos2 = 800;
    yPos2 = 200;
  } else if (phase == 41) {
    bgr=100 - darkness1;
    bgg=180 - darkness2;
    bgb=200 - darkness3;
    xPos2 = 850;
    yPos2 = 200;
  } else if (phase == 42) {
    bgr=153 - darkness1;
    bgg=217 - darkness2;
    bgb=234 - darkness3;
    phase = 0;
  }

  noStroke();
  fill(bgr - darkness1, bgg - darkness2, bgb - darkness3);
  rect(-5 + picX, -5 + picY, 90, 75);
  fill(255, 242, 0);
  rect(xPos/10 + picX, yPos/10 -5 + picY, 10, 20); //sun1
  rect(xPos/10 -5 + picX, yPos/10 + picY, 20, 10); //sun2
  fill(200, 200, 200);
  rect(xPos2/10 + picX, yPos2/10 -5 + picY, 10, 20); //moon1
  rect(xPos2/10 -5 + picX, yPos2/10 + picY, 20, 10); //moon2
  fill(255);
  rect(cloudPosX/10 + 0 + picX, (cloudPosY*5) + picY, 15, 15); //cloud
  rect(cloudPosX/10 + -5 + picX, 5 + (cloudPosY*5) + picY, 5, 5); //cloud
  rect(cloudPosX/10 + 15 + picX, 5 + (cloudPosY*5) + picY, 5, 5); //cloud
  fill(34, 177, 76);
  rect(0 + picX, 60 + picY, 80, 5); //grass
  fill(255, 255, 255);
  rect(5 + picX, 35 + picY, 35, 25); //house
  fill(153, 217, 234);
  rect(10 + picX, 40 + picY, 10, 10); //window1
  rect(25 + picX, 40 + picY, 10, 10); //window2
  fill(185, 122, 87);
  rect(0 + picX, 30 + picY, 45, 5); //roof1
  rect(5 + picX, 25 + picY, 35, 5); //roof2
  rect(10 + picX, 20 + picY, 25, 5); //roof3
  rect(35 + picX, 50 + picY, 5, 10); //door
  rect(60 + picX, 40 + picY, 5, 20); //treebase
  fill(136, 0, 21);
  rect(30 + picX, 15 + picY, 5, 10); //chimney
  fill(34, 177, 76);
  rect(55 + picX, 15 + picY, 15, 25); //tree1
  rect(50 + picX, 20 + picY, 25, 15); //tree2
  fill(0);
  rect(-5 + picX, -5 + picY, 5, 75);
  rect(80 + picX, -5 + picY, 5, 75);
  rect(-5 + picX, -5 + picY, 90, 5);
  rect(-5 + picX, 65 + picY, 90, 5);
  fill(185, 122, 87);
  rect(0, 300, 450, 50); //roof1
  rect(50, 250, 350, 50); //roof2
  rect(100, 200, 250, 50); //roof3
  rect(350, 500, 50, 100); //door
  rect(600, 400, 50, 200); //treebase

  fill(136, 0, 21);
  rect(300, 150, 50, 100); //chimney
  fill(34, 177, 76);
  rect(550, 150, 150, 250); //tree1
  rect(500, 200, 250, 150); //tree2
  fill(255, 242, 100);
  rect(250, 400, 5, 100);
  rect(345, 400, 5, 100);  
  rect(250, 400, 100, 15);
  fill(255);
  rect(200, 400, 50, 100);
  rect(350, 400, 50, 100);

  ///LIGHTS///
  if (light1off == true) {
    fill(0, 0, 0);
    rect(100, 400, 100, 100); //window1
  }
  if (light2off == true) {
    fill(0, 0, 0);
    rect(250, 400, 100, 100); //window2
  }
  ///
  /// WEATHER
  ///
  if (weather==0) {
    darkness1 = .2 * bgr;
    darkness2 = .2 * bgg;
    darkness3 = .2 * bgb;
  }
  if (weather==1) {
    darkness1 = .2 * bgr;
    darkness2 = .2 * bgg;
    darkness3 = .2 * bgb;
  }
  if (weather==2) {
    darkness1 = 0;
    darkness2 = 0;
    darkness3 = 0;
  }
  if (weather==4) {
    darkness1 = 0;
    darkness2 = 0;
    darkness3 = 0;
  }

  if (weatherchosen != true && phase == 41) {
    weather = (int) random(3);
    weatherchosen = true;
  }
  if (phase==21) {
    weatherchosen = false;
    snowarrayset = false;
    rainarrayset = false;
  } 
  if (snowarrayset==false) {
    for (int i = 0; i < 150; i++) {
      snowX[i] = random(0, width);
      snowY[i] = random(-width*2, height);
      snowSize[i] = random(5, 10); // Snow
      snowarrayset = true;
    }
  }
  if (phase>=0 && phase < 21 && weather == 0) {
    for ( int i =0; i <150; i++) {
      fill(255, 255, 255);
      ellipse(snowX[i], snowY[i], snowSize[i], snowSize[i]); //Snow
      snowY[i] = snowY[i] + (realspeed/100);
      if (resetpossnow = false) {
        snowbackupX[i] = snowX[i];
        snowbackupY[i] = snowY[i];
        resetpossnow = true;
      }
    }
  }
  if (rainarrayset==false) {
    for (int i = 0; i < 1500; i++) {
      rainX[i] = random(0, width);
      rainY[i] = random(-width*23.5, 0);
      rainSize[i] = random(1, 2); // Rain
      rainarrayset = true;
    }
  }
  if (phase>0 && phase < 21 && weather == 1) {
    for ( int i = 0; i <1500; i++) {
      fill(255);
      ellipse(rainX[i], rainY[i], rainSize[i], rainSize[i] * 5); //Rain
      rainY[i] = rainY[i] + (realspeed/10);
    }
  }


  ///
  ///
  /// Concerning text applications.
  ///
  ///
  int indent = 52;
  textFont(f);
  fill(0);



  if (textOpen == true) {
    text("Type in your commands below", indent, 370);
    text(typing, indent, 390);
    if (saved.indexOf("snow")>=0)
    {
      weather = 0;
      saved = " ";
      weatherchosen = true;
    }
    if (saved.indexOf("rain")>=0)
    {
      weather = 1;
      saved = " ";
      weatherchosen = true;
    }
    if (saved.indexOf("clear")>=0)
    {
      weather = 2;
      saved = " ";
      weatherchosen = true;
    }
    if (saved.indexOf("reset")>=0)
    {
      phase = 0;
      saved = " ";
      cloudPosX = -250;
      snowarrayset = false;
      rainarrayset = false;
    }  
    if (saved.indexOf("sonic")>=0)
    {
      speed = 50;
      saved = " ";
    }  
    if (saved.indexOf("sanic")>=0)
    {
      speed = 25;
      saved = " ";
    }  
    if (saved.indexOf("turtle")>=0)
    {
      speed = 1000;
      saved = " ";
    }  
    if (saved.indexOf("freeze")>=0)
    {
      changeintime1 = 0;
      changeintime2 = 0;
      oldspeed = speed;
      speed = 1100;
      saved = " ";
    }  
    if (saved.indexOf("resume")>=0)
    {
      changeintime1 = 1;
      changeintime2 = 50;
      speed = 1000;
      saved = " ";
    }
    if (saved.indexOf("smoke")>=0)
    {
      if (smoke == false)
      smoke = true;
      else
      smoke = false;
      saved = " ";
    }
  }


  for ( int fenceX =0; fenceX <800; fenceX= fenceX + 30) {
    fill(230, 230, 230);
    rect(fenceX, 550, 20, 100); //fence
    triangle(fenceX, 550, fenceX+10, 530, fenceX + 20, 550);
    rect(fenceX, 560, 50, 10);
  }
//  rect(300, 150, 50, 100); //chimney
  
  if (smoke == true) {
    if (smokeY>800) {
      smokeY = 0;
      smoke2Y= 150;
    } else if (smokeY<801) {
      smokeY = smokeY + 1;
    }
  }
  else {
          smokeY = 1000;
  }
  
  if (smoke == true) {
    if (smokeY2>800) {
      smokeY2 = 0;
      smoke2Y2= 50;
    } else if (smokeY2<801) {
      smokeY2 = smokeY2 + 1;
    }
  }
  else {
          smokeY2 = 1000;
  }
  
  if (smoke == true) {
    if (smokeY3>800) {
      smokeY3 = 0;
      smoke2Y3= -50;
    } else if (smokeY3<801) {
      smokeY3 = smokeY3 + 1;
    }
  }
  else {
          smokeY3 = 1000;
  }

  if (smoke == true) {
    if (smokeY4>800) {
      smokeY4 = 0;
      smoke2Y4= -150;
    } else if (smokeY4<801) {
      smokeY4 = smokeY4 + 1;
    }
  }
  else {
          smokeY4 = 1000;
  }
  
    if (smoke == true) {
    if (smokeY5>800) {
      smokeY5 = 0;
      smoke2Y5= -250;
    } else if (smokeY5<801) {
      smokeY5 = smokeY5 + 1;
    }
  }
  else {
          smokeY5 = 1000;
  }

  if (menu == true) {
    changeintime1 = 0;
    changeintime2 = 0;
    oldspeed = speed;
    speed = 1100;
    saved = " ";
    fill(0, 0, 0, 200);
    rect(0, 100, 800, 550);
    fill(170, 50, 50, 150);
    rect(0, 0, 800, 100);
    fill(255);
    textFont(g);
    fill(50);
    text("PAUSE", 390, 52, -20);
    fill(255);
    text("PAUSE", 390, 50);
    textFont(f);
    text("Click the tree to enable written commands.\nClick the chimney to turn on/off smoke.\n\n\nClick a window to turn on/off the light.\nCommands:\nfreeze = freeze the animation\nresume = resume the animation\nsnow = make the next weather snow\nrain = make the weather rain\nclear = make the sky clear\nreset = resets program to base. If you want to check weather, type the weather and then type reset.\nsonic = for when you gotta go fast\nsanic = for when you gotta go faster\nsmoke = toggle the smoke\n\nYou can use the numbers 1-9 to change the speed.", 50, 150);
    stroke(20);
    fill(123, 15, 12);
    rect(20, 10, 25, 25);
    fill(255);
    text("X", 27, 28);
  }
  
  textFont(f);
  stroke(20);
  fill(123, 15, 12);
  rect(700, 10, 90, 25);
  fill(255);
  text("MENU", 720, 27);
}


void keyPressed() {
  if (key == '\n' ) {
    saved = typing;
    typing = " ";
  } else if (int(key) == 48 ||int(key) == 49 || int(key) == 50 || int(key) == 51 || int(key) == 52 || int(key) == 53 || int(key) == 54 || int(key) == 55 || int(key) == 56 || int(key) == 57) {
    if (int(key) == 49) {
      speed = 1000;
    }
    if (int(key) == 50) {
      speed = 900;
    }
    if (int(key) == 51) {
      speed = 800;
    }
    if (int(key) == 52) {
      speed = 700;
    }
    if (int(key) == 53) {
      speed = 600;
    }
    if (int(key) == 54) {
      speed = 500;
    }
    if (int(key) == 55) {
      speed = 400;
    }
    if (int(key) == 56) {
      speed = 300;
    }
    if (int(key) == 57) {
      speed = 200;
    }
    if (int(key) == 48) {
      speed = 200;
    }
  } else if (keyCode == BACKSPACE && typing.length()>0) {
    typing = typing.substring(0, typing.length() - 1);
  } else if (keyCode == BACKSPACE && typing.length()==0) {
    typing = typing.substring(0, typing.length());
  } else
    if (textOpen == true) {
    if (key != CODED) typing += key;
  }
}

void mousePressed() {
  if (mouseX <= 790 && mouseX >= 700 && mouseY <= 35 && mouseY >= 10 && menu == false) {
    menu = true;
  }
  if (mouseX <= 45 && mouseX >= 20 && mouseY <= 35 && mouseY >= 10 && menu == true) {
    menu = false;
    changeintime1 = 1;
    changeintime2 = 50;
    speed = 1000;
    saved = " ";
  }
  if (weather != 4 || phase>21) {
    if (mouseX <= 200 && mouseX >= 100 && mouseY <= 500 && mouseY >= 400 && light1off == false) {
      light1off = true;
    } else if (mouseX <= 200 && mouseX >= 100 && mouseY <= 500 && mouseY >= 400 && light1off == true) {
      light1off = false;
    } else if (mouseX <= 350 && mouseX >= 250 && mouseY <= 500 && mouseY >= 400 && light2off == false) {
      light2off = true;
    } else if (mouseX <= 350 && mouseX >= 250 && mouseY <= 500 && mouseY >= 400 && light2off == true) {
      light2off = false;
    } else if (mouseX <= 350 && mouseX >= 300 && mouseY <= 250 && mouseY >= 150 && smoke == false) {
      smoke = true;
    } else if (mouseX <= 350 && mouseX >= 300 && mouseY <= 250 && mouseY >= 150 && smoke == true) {
      smoke = false;
    } else if (mouseX <= 700 && mouseX >= 550 && mouseY <= 400 && mouseY >= 150 && textOpen == false) {
      textOpen = true;
    } else if (mouseX <= 750 && mouseX >= 700 && mouseY <= 350 && mouseY >= 200 && textOpen == false) {
      textOpen = true;
    } else if (mouseX <= 550 && mouseX >= 500 && mouseY <= 350 && mouseY >= 200 && textOpen == false) {
      textOpen = true;
    } else if (mouseX <= 650 && mouseX >= 600 && mouseY <= 600 && mouseY >= 400 && textOpen == false) {
      textOpen = true;
    }
  }
}
