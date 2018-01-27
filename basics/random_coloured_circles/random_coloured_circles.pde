void setup()
{
    size(500,400);
    background(0);
}

int x;
int y;
int circum = 100;

void draw()
{
  x = mouseX;
  y = mouseY;
  fill(random(255), random(255), random(255));
  if ( mousePressed )
  {
    if (circum > 50 )
        circum -= 10;
    if ( mouseButton == LEFT )
    {
      stroke(255);
      fill(255,0,0);
    } else if ( mouseButton == RIGHT ) {
              stroke(255);
              fill(20,33,255);
            }
  }
  ellipse(x, y, circum, circum);
}