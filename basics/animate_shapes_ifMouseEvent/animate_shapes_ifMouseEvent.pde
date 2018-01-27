int value = 0;

void setup() 
{
    size(400, 400);
    noStroke();
    fill(0);
}

void mousePressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void quadrant_square()
{
     if ((mouseX < 200) && (mouseY < 200))
     {
        fill(200,255,100);  //lime
        rect(0, 0, 200, 200);
      } else if ((mouseX >= 200) && (mouseY < 200)) 
             {
                 fill(100,10,100);  //dark purple
                 rect(200, 0, 400, 200);
              } else if ((mouseX >= 200) && (mouseY >= 200)) 
                      {
                          fill(10,10,200); //blue
                          rect(200,200,400,200);
                      }
                      else {
                             fill(190,10,0);
                             rect(0,200,200,400); 
                           }
}

void draw() 
{     
   // mouse pressing
   
   // Click within the image to change 
   // the value of the rectangle
   stroke(255);
   quadrant_square();
   if ( mousePressed ) 
   {
     background(204);
     if (mouseButton == LEFT)
         value = 0;  //black
     else if (mouseButton == RIGHT)
              value = 255; //white
     else value = 126;   //gray 
   }
   fill(value);
   ellipse(mouseX, mouseY, pmouseX, pmouseY);
}