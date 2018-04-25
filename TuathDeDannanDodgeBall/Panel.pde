
public class Panel {
  
  // constraints
  private int minHeight = 200;
  private int maxHeight = displayHeight;
  
  //Note width and xCoord are fixed with display
  
  // properties
  private int xCoord;         // X coordinate of panels is zero default
  private int xWidth; 
  private int yCoord;         // Y coordinate of the panel
  private int yHeight;        // height of the panel
  private color colour;       // fill-colour of the panel
  private String imgUrl;
   
  //------- Constructors --------//
  
  public Panel(int xCoord, int yCoord, int xWidth, int yHeight)
  {
    //Panel dimensions are constant during program exectuion
    setXCoord(xCoord);
    setWidth(xWidth);
    setYCoord(yCoord);
    setyHeight(yHeight);
  }
  
  public Panel(int xCoord, int yCoord, int xWidth, int yHeight, color colour)
  {
    //Panel dimensions are constant during program exectuion
    this(xCoord, yCoord, xWidth, yHeight);
    setColor(colour);
  }
  
  public Panel(int xCoord, int yCoord, int xWidth, int yHeight, String url)
  {
    //Panel dimensions are constant during program exectuion
    this(xCoord, yCoord, xWidth, yHeight);
    setImgUrl(url);
  }
  
  // Update panel appearance
  public void update(color colour)
  {
    setColor(colour);
  }
   
  // Draw panel to the display window
  public void display()
  {
    fill(this.colour);
    noStroke();
    rect(xCoord, yCoord, xWidth, yHeight);
    String url = getImgUrl();
    if (url != null)
    {
      PImage img = loadImage(url, "png");
      image(img, xCoord, yCoord);
    }
  }
  
  //clear the panel
  public void clear()
  {
    fill(255);
    noStroke();
    rect(xCoord, yCoord, xWidth, yHeight);
  }  
   //------- Getter methods ---------//
   public color getColor() 
   {
     return colour;
   }
   public int getHeight() 
   {
     return yHeight;
   }
   
   public int getWidth() 
   {
     return width;
   }
   
   public int getXCoord() 
   {
     return xCoord;
   }

   public int getYCoord() 
   {
     return yCoord;
   }
   
   public String getImgUrl() 
   {
     return imgUrl;
   }
   
   //------- Setter methods --------//
     
   public void setColor(color colour) 
   {
     this.colour = colour;
   }
   public void setyHeight(int yHeight)
   {
     // Set the panel height within constraints
     if (yHeight < minHeight)
     {
       //not allowed, constrain to minimum height.
       this.yHeight = minHeight;
     } 
     else if (yHeight > maxHeight)
     {
       //not allowed, constrain to maximum height.
       this.yHeight = maxHeight;
     }
     else 
     { 
       this.yHeight = yHeight; 
     }
   }
     
   public void setWidth(int xWidth)
   {
     // Constrain width
     if (xWidth < 0 || xWidth > width)
     {
       //not allowed, constrain to screen width
       this.xWidth = width;
     }
     else 
     {
       this.xWidth = xWidth;
     }
   }
      
   public void setXCoord(int x)
   {
     this.xCoord = x;
   }
   
   public void setYCoord(int y)
   {
     this.yCoord = y;
   }
   
   public void setImgUrl(String url) 
   {
     this.imgUrl = url;
   }
}