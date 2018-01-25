//Setting up the display window
size(400,300);
background(151,13,255);
strokeWeight(3);

//Drawing a rectangle
float rx = 100;
float ry = 100;
float rw = 170;
float rh = 80;
fill(100,150,70);
rect(rx,ry,rw,rh);

//Drawing a square
float sx = 140;
float sy = 180;
float sw = 15;
float sh = 15;
rect(sx,sy,sw,sh);

//Drawing a line
float rx2 = 270;
float ry2 = 180;
line(rx,ry,rx2,ry2);

//Drawing an ellipse
float ex = 185;
float ey = 100;
float ew = 15;
float eh = 50;
fill(200,250,70);
noStroke();
ellipse(ex,ey,ew,eh);

//Drawing an circle
float cx = 225;
float cy = 125;
float cc = 20;
stroke(0,0,0);
ellipse(cx,cy,cc,cc);