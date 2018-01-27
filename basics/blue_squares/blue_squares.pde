// setting the size and colour of the window
size(300,280);
background(0);

//drawing three blue lines
stroke(0,100,255);
strokeWeight(3);
line(width-230, height-260, width-70, height-260);        // top line
line(width-230, height-252, width-70, height-252);    // second line
line(width-230, height-240, width-70, height-240);  //third line
line(width-230, height-215, width-70, height-215);  //fourth line

//finish the square
line(width-230, height-260, width-230, height-140);  //left line
line(width-70, height-260, width-70, height-140);  //right line
line(width-230, height-140, width-70, height-140); //bottom line

//Square
rect(width-200, height-120, width-200, width-200);