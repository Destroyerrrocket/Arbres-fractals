float tPos=radians(0);
float tSpeed=0.000001;
float tForce = 0.00002;
int branches = 12;

void setup() {
  fullScreen();
}

void draw() {
//Movement Speed
  if (tPos>radians(5)&&tSpeed>0) {
    tForce=-0.00002;
  }
  if (tPos<radians(5)&&tSpeed<0) {
    tForce=0.00002;
  }
  if (tSpeed > -0.000001 && tSpeed < 0.000001) {
    tForce=0.00000000001;
    if (tSpeed  > -0.000000001 && tSpeed < 0.000000001)
      tForce=0.0;
      tSpeed=0;
  }
  tSpeed+=tForce;
  tPos+=tSpeed;

  background(0);
  tree(width/1.2, (height), -PI/2, (height/10)*tPos*6.5, color(#0000FF), 8, 8, color(50, 40, 0));
  tree(width/5, (height), -PI/2, (height/17)*tPos*6.5, color(#00FF00), 7, 9, color(40, 0, 0));
  tree(width/2, (height), -PI/2, (height/4.85)*tPos*6.5, color(242, 20, 0), 12, 15, color (-10, 10, 30));
}

void tree(float x, float y, float a, float l, color c, int s, int branches, color sum) {
    if (branches==0) {
      return;
    }
  float x2 = l*cos(a)+x;
  float y2 = l*sin(a)+y;
    stroke(c);
  strokeWeight(s);
  int newstroke = s - 1;
  line(x, y, x2, y2);
  if (newstroke == 1) {
    newstroke += 1; 
  }
    tree(x2, y2, a-tPos*PI, l*0.8, sumarcolors(c, sum), newstroke, branches -1, sum);
    tree(x2, y2, a+tPos*PI, l*0.8, sumarcolors(c, sum), newstroke, branches -1, sum);
}
color sumarcolors (color color1, color color2) {
  
  float color1Red = red(color1);
  float color1Green = green(color1);
  float color1Blue = blue(color1);
  
  float color2Red = red(color2);
  float color2Green = green(color2);
  float color2Blue = blue(color2);
  
  float colorfinalRed = color1Red + color2Red;
  float colorfinalGreen = color1Green + color2Green;
  float colorfinalBlue = color1Blue + color2Blue;
  
  if(colorfinalRed > 255) {
  colorfinalRed = 255;
  }
  if(colorfinalGreen > 255) {
  colorfinalGreen = 255;
  }
  if(colorfinalBlue > 255) {
  colorfinalBlue = 255;
  }
  color colorfinal = color(colorfinalRed, colorfinalGreen, colorfinalBlue);
return colorfinal;
}