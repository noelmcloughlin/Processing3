int diameter = 100;
int x = 0;
int y = 0;

void setup() 
{
  int i = 1;
  
  size(400,400);
  background(102);
  
  //Draw grid with while loops
  background(155);
  stroke(204, 102, 0);
  x=0;
  while (x <= width)
  {
    line(x, 0, x, height);
    y=0;
    while (y <= height)
    {
      line(x, y, width,y);
      y += (height/8);
    }
    x += (width/8);
  }
  // Draw grid with for loops
  for (i=10;i>=0;i-=2)
  {
    println(i);
  }
  // Print stuff to console
  i=10;
  while (i>=0)
  {
    println(i);
    i-=2;
  }
  println("Blast off");
  
  // Draw a chessboard with rects/modulo
  int shade = 255;
  for (x=0; x<400; x+=50)
  {      
      if ((shade % (width/8)) == 0)
          shade=255;
      else
          shade=0;
    for (y=0; y<400; y += 50)
    {
      if ((shade % (height/8)) == 0)
          shade=255;
      else
          shade=0;
      fill(shade);
      println(x,y);
      rect(x, y, (width/8), (height/8));
    }
  }
}

void draw() 
{
}