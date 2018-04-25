//# Insect simulation 
//# Spiders...
//# noelmcloughlin

Insect[] spider;
int population=0;
int width=600;
int height=600;
float background=0;

//For JOptionPane class
import javax.swing.JOptionPane;

//For OpenGL rendering described in API https://tinyurl.com/y8u2w7og
import processing.opengl.PGraphicsOpenGL;

void settings()
{
  size(width,height,OPENGL);
  JOptionPane.showMessageDialog(null, "Welcome to my insect simulator (currently I only simulate spiders)");
  while ((population <= 0) || (population > 6)) {
    population = Integer.parseInt(JOptionPane.showInputDialog("Enter number of insects (minimum 1, maximum 6)", population ));
  }
  pixelDensity(2);
}
    
void setup()
{
  int legs=8;
  frameRate(20);
  
  noStroke();
  // Loop through population instantiating insects
  spider = new Insect[population];
  if (spider != null) {
    for (int i=0; i < population; i++)
    {
      //generate each insect (spider) trying to randomize x,y coordinates
      float stepx = random(-1, 1);
      float stepy = random(-1, 1);
      spider[i] = new Insect("Spider"+i, legs, 0, stepx, stepy, width/3/population);
    }
  }
}

void draw()
{
  background(background);
  //random walking spider(s), with random directional bias
  for (int i=0; i < population; i++)
  {
    spider[i].display();
    spider[i].randomWalk();
    println(spider[i].name, " :- ", spider[i].x, spider[i].y);
  }
}

void mousePressed() {
  println("mouse pressed");
  background((int) random(100));
  frameRate(random(20,200));
}