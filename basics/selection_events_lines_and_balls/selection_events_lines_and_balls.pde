void setup()
{
  size(400,400);
}

int yMin = 30;
int yMax = 360;
int xMin = 30;
int xMax = 360;
int xCoord = 100;
int yCoord = yMin;
int value = 0;

boolean down = true;
boolean right = true;
  
void draw() 
{  
  background(yCoord);
  fill(255,0,0);
  
  // Bouncing circles
  if (yCoord == yMin)
      down = true;
  if (yCoord == yMax)
      down = false;
  if (down)
      yCoord += 2;
  else
      yCoord -= 2;
  ellipse(xCoord,yCoord,40,40);
  line(xCoord, 0, xCoord, height);
  
  // Bouncing line
  if (xCoord == xMin)
      right = true;
  if (xCoord == xMax)
      right = false;
  if (right)
      xCoord += 2;
  else
      xCoord -= 2;
  line(xCoord, 0, xCoord, height);
}

void keyPressed()
{
  if ((key == 99) || (key == 67))
      ellipse(mouseX, mouseY, mouseX+50, mouseY+50);
  else
      rect(mouseX, mouseY, 140,140);
}