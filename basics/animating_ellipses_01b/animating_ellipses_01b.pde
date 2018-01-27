
/* lab01b_step02. */
void setup()
{
    size(500,400);
}

void draw()
{
  // recursively execute this code
  background(0);  // set to black, grayscale spectrum
  stroke(0);  //black outline
  fill(60,220,90);  //green
  ellipse(mouseX, mouseY, 100, 100);
  fill(200,100,100);
  ellipse(width, mouseX, 100, 100);
}