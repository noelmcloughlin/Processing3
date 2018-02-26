void setup()
{
  size(250,250);
  background(204);
}
void draw()
{
  fill(204);
  drawX(140, i, 1 ,1, i);
  drawX(70, 15, 45, 30, 35);
  drawX(255, 2, 35, 50, 200);
  }
  noStroke();
  eye(200,150);
  eye(150,155);
  eye(200,180);
  eye(150,185);
  eye(200,210);
  eye(150,215);
}
void eye(int x, int y)
{
  fill(255);
  ellipse(x,y,60,60);  //outer white circle
  fill(0);
  ellipse(x+10, y, 30,30);  //black circle
  fill(255);
  ellipse(x+16,y-4,6,6);  //small, white circle
}
void drawX()
{
  stroke(150);
  strokeWeight(20);
  line(200,1,20,20);
  line(220,1,1,20);
}
void drawX(int stroke)
{
  stroke(stroke);
  strokeWeight(20);
  line(1,1,70,70);
  line(70,1,1,70);
}
void drawX(int stroke, int weight)
{
  stroke(stroke);
  strokeWeight(weight);
  line(1,1,70,70);
  line(70,1,1,70);
}
void drawX(int stroke, int weight, int x, int y, int size)
{
  stroke(stroke);
  strokeWeight(weight);
  line(x,y,x+70,y+70);
  line(x+70,y,x,y+70);
}
  