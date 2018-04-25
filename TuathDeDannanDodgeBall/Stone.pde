//----------------------------------------------//
// Idea is based on Reas and Fry (2014) example //
//----------------------------------------------//
public class Stone
{
  // attributes of a stone
  private color stoneColor;       //Identify friendly/threatening magic-stones by color.
  private float xCoord;           //x coordinate of stone
  private float yCoord;           //y coordinate of stone
  private float diameter;         //diameter of stone
  private float speedX;           //speed on x-axis, physics
  private float speedY;           //speed on y-axis, physics

  // constraints
  private float maxDiameter = 100;
  private float minDiameter = 10;

  //------- stone constructor -------//

  public Stone(float diameter, float xCoord, float yCoord, color colour)
  {
    setDiameter(diameter);
    setColor(colour);
    setXCoord(xCoord);
    setYCoord(height);
    resetStone();
  }

  //---------- mutators -----------//

  //when we hit an attacker, reset *our* Stone back to *our* coordinates.
  public void update(float xCoord, float yCoord)
  {
    setXCoord(xCoord-200);
    setYCoord(yCoord-200);
    update();
  }       

  // Update the Stone location based on environmental checks
  public void update()
  {
    setXCoord(xCoord + speedX*2);
    setYCoord(yCoord + speedY*2);

    //If stone hits left display then reverse direction on x-axis
    if (xCoord < diameter/2)
    {
      xCoord = diameter/2;
      speedX = speedX * -1;
    } 
    else if (xCoord > width-diameter/2)
    {
      xCoord = width-diameter/2;
      speedX = speedX * -1;
    }

    //If stone hits cloud boundary apply gravity
    //If stone hits ground, bounce.
    //Either way we change stone direction...
    if (yCoord > height - diameter/2)
    {
      yCoord = height - diameter/2;
      speedY = speedY * -1;
    } 
    else if (yCoord < consoleY + diameter/2)
    {
      yCoord = consoleY + diameter/2;
      speedY = speedY * -1;
    }
  }
  
  //Draw stone in display console
  public void display()
  {
    fill(stoneColor);
    noStroke();
    ellipse(xCoord, yCoord, diameter+5, diameter+5);
  }

  // change ball direction when it hits object
  public void hit()
  {
    speedY = speedY * -1;
    //xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;
  }


  //---- Getters -----//

  public color getColor()
  {
    return stoneColor;
  }

  public float getDiameter()
  {
    return diameter;
  }

  public float getMaxDiameter()
  {
    return maxDiameter;
  }

  public float getMinDiameter()
  {
    return maxDiameter;
  } 

  public float getXCoord()
  {
    return xCoord;
  }  

  public float getYCoord()
  {
    return yCoord;
  }

  public float getSpeedX()
  {
    return this.speedX;
  }  

  public float getSpeedY()
  {
    return this.speedY;
  }  

  //------ Setters ------//

  public void setColor(color colour)
  {
    this.stoneColor = colour;
  }

  public void setDiameter(float diameter)
  {
    //Need sensible values for stone diameter; checking constraints
    if ((diameter >= minDiameter) && (diameter <= maxDiameter))
    {
      this.diameter = diameter;
    } else 
    {
      // punish bad values - make hero wide!  ;-)
      this.diameter = maxDiameter;
    }
  }

  public void setSpeedX(float speed)
  {
    this.speedX = speed;
  }

  public void setSpeedY(float speed)
  {
    this.speedY = speed;
  }

  public void setXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }

  private void resetStone()
  {
    xCoord = getXCoord();
    yCoord = height-diameter;
    speedX = -random(3, 6);   
    speedY = -random(-3, 3);
  }
}