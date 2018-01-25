//Setting up the display window
size(650,750);
background(200,255,255);
noStroke();

//Microsoft Banner
// square
float x = 2;
float y = 2;
float w = 320;
float h = 56;
fill(24,133,208);
rect(x,y,w,h);
// triangle
triangle(x,56,30,56,30,86);

//Main Microsoft Logo square
x = 62;
y = 59;
w = 184;
h = 184;
stroke(0,0,0);
strokeWeight(2);
fill(255,255,255);
rect(x,y,w,h);
strokeWeight(0);

// Logo Red square
x += 32;
y += 32;
w = 56;
fill(242,80,34);
rect(x,y,w,w);

// Logo Green square
x += 61;
fill(127,186,0);
rect(x,y,w,w);

// Logo blue square
x -= 61;
y += 61;
fill(3,164,239);
rect(x,y,w,w);

// Logo Yellow square
x += 61;
fill(255,185,0);
rect(x,y,w,w);

//Main Microsoft Logo square
 x = 262;
 y = 59;
 w = 184;
 h = 184;
stroke(0,0,0);
strokeWeight(2);
fill(255);
rect(x,y,w,h);
strokeWeight(0);

// Logo Red square
x += 32;
y += 32;
w = 56;
fill(50);
rect(x,y,w,w);

// Logo Green square
x += 61;
fill(75);
rect(x,y,w,w);

// Logo blue square
x -= 61;
y += 61;
fill(100);
rect(x,y,w,w);

// Logo Yellow square
x += 61;
fill(125);
rect(x,y,w,w);

// *** DR DRE ****
//Banner rectangle
 x = 2;
 y = 260;
 w = 340;
 h = 56;
fill(24,133,208);
noStroke();
rect(x,y,w,h);
// Banner Triangle
triangle(x,316,30,316,30,346);

//Main DRE Logo square
 x = 62;
 y = 316;
 w = 265;
 h = 265;
stroke(0,0,0);
strokeWeight(2);
fill(255,255,255);
rect(x,y,w,h);
strokeWeight(0);

// Main logo circle
fill(237,28,35);
ellipse(195,448,260,260);

//inner circle
fill(255,255,255);
ellipse(195,448,130,130);

//innermost circle
fill(237,28,35);
ellipse(195,448,60,60);

// Downstroke rectangle
x = 130;
y = 320;
w = 35;
h = 130;
noStroke();
fill(255,255,255);
rect(x,y,w,h);

//Media Player controls
 x = 4;
 y = 600;
 w = 600;
 h = 135;
stroke(0);
strokeWeight(2);
fill(155);
rect(x,y,w,h);
fill(255);

// Play button
x = 100;
y = 665;
w = 80;
ellipse(x,y,w,w);

// Pause button
x = 200;
ellipse(x,y,w,w);

// Stop button
x = 300;
ellipse(x,y,w,w);

//Forward button
x=400;
ellipse(x,y,w,w);

// Rewind button
x = 500;
ellipse(x,y,w,w);

// Embedded Symbols
fill(0);

triangle(85,645,85,685,125,y);
w = 40;
rect(180,645,16,w);
rect(206,645,16,w);
rect(280,645,w,w);
triangle(380,645,380,685,410,y);
triangle(395,645,395,685,425,y);
triangle(500,645,500,685,470,y);
triangle(515,645,515,685,480,y);