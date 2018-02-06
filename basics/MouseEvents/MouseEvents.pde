void setup()
{
  size(500, 500);
  background(0);
  frameRate(1);
  textAlign(CENTER);
  textSize(24);
  fill(255);
  text("Mouse has done nothing", width/2, height/2);
  textSize(32);
  text("word", 100, 30); 
  fill(0, 102, 153);
  text("word", 100, 60);
  fill(0, 102, 153, 51);
  text("word", 100, 90); 
}

void drawEllipse()
{
  fill(128);
  ellipse(45,45,34,34);
  ellipse(mouseX, mouseY, 100, 100);
}

void draw()
{
  background(0);
  stroke(255);
  fill(45,45,45);
  stroke(255);
  drawEllipse();
  fill(255);
  text("mouse done nothing", width/2, height/2); 
}

void mouseMoved() {
  background(255, 37, 209);
  drawEllipse();
  fill(255);
  text("mouse was moved", width/2, height/2); 
}
void mouseDragged() {
  background(32, 109, 232);
  drawEllipse();
  fill(255);
  text("mouse was dragged", width/2, height/2); 
}
void mouseReleased() {
  background(156, 24, 255);
  drawEllipse();
  fill(255);
  text("mouse was released", width/2, height/2); 
}
void mousePressed() {
  background(143, 232, 104);
  drawEllipse();
  fill(255);
  rect(45,45,34,34);
  if (mouseButton == LEFT){
    text("mouse was pressed\nand it was the left button", width/2, height/2);
  } else
  {
     text("mouse was pressed\nand it was the right button", width/2, height/2);
  }
}