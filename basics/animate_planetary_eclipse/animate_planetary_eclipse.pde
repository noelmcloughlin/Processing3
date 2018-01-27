void setup()
{
    size(500,400);
}

void draw()
{
  float x = mouseX;
  float y = mouseY;
  
  // recursively execute this code
  background(0);  // set to black, grayscale spectrum
  stroke(0);  //black outline
  fill(155,155,44);  //white
  cursor(HAND);
  ellipse(y-50, y+50, y, y+55);
  fill(230,40,244);
  ellipse(y+x, x-y, x+45, x-50);
  // Move the mouse quickly to see the difference 
  // between the current and previous position

  //light circle
  fill(240,240,240);
  ellipse(x-10, x, x, y);
  //greeny circle
  fill(200,255,188);
  ellipse(x, y, y, x);
  strokeWeight(6);
  stroke(111,255,175);
  line(x, y-120, x-100, y-50);
} 