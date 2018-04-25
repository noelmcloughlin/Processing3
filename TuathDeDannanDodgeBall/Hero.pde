public class Hero
{
   //physical attributes
   private boolean attacker;     //Is hero attacker (display right) or defender (display left);
   private color heroColor;      // color-identity of the hero
   private int heroHealth = 100; // mental and physical health score
   private int heroHeight;        // height of the hero
   private String heroName;       // name of the tuath hero
   private int heroPower = 100;   // power-score of the hero
   private int heroWidth;         // width of the hero 
   private Panel imgPanel;        // Image of the Hero
   private int xCoord;            // X coordinate of the hero
   private int yCoord;            // Y coordinate of the hero
   
   //constraints
   private int maxHeight = 100;   // Punish bad values by making hero tall ;-)
   private int minHeight = 20;    // These are height constraints.
   private int maxWidth = 100;    // Punish bad values by making hero wide ;-)
   private int minWidth = 20;     // These are width constraints
   
  
  //----- Constructor (no image) --------//

  public Hero(int heroWidth, int heroHeight, color heroColor, boolean attacker)
   {
     gainHealth(100);
     gainPower(100);
     setAttacker(attacker);
     setColor(heroColor);
     setHeight(heroHeight);
     setWidth(heroWidth);
     //the xCoordinate variable changes as mouse moves on horizontal plane
     if (attacker == true)
     {
       setXCoord(width - (int) random(heroWidth, width/2) + heroWidth);
     }
     else
     {
       setXCoord((int) random(0, width/2) - heroWidth);
     }
     //the yCoordinate variable has fixed value (hero cannot jump/sleep)
     setYCoord(height-heroHeight);
   }
   
   //----- Constructor (with image) --------//
     
   public Hero(int heroWidth, int heroHeight, color heroColor, boolean attacker, Panel img)
   {
     this(heroWidth, heroHeight, heroColor, attacker);
     
     // Draw Hero image once because imagges are CPU intensive.
     setImgPanel(img);
     this.imgPanel.display();  
   }
     
   //---------- Modifiers -------------//
 
   // Change horizontal position of *Defender* Hero according to cursor movement in the *Console*
   public void update()
   {
     setXCoord(mouseX - heroWidth/2);
   
     // Nudge fleeing cowards back to the battle.
     if (xCoord < 0)
     {
        setXCoord(0 + heroWidth); 
     }
     if (xCoord > (width - 100 - heroWidth))
     {
        setXCoord(width - 100 - heroWidth);
     }
   }
   
   // Draw hero to the display window
   public void display()
   {
     fill(heroColor);
     noStroke();
     rect(xCoord, yCoord, heroWidth, heroHeight);
   }
   
  //---- Getters -------//
   
   public int getXCoord()
   {
      return xCoord;
   }
   public int getYCoord()
   {
      return yCoord;
   }
   public int getHealth()
   {
     return heroHealth;
   }
   public int getWidth()
   {
      return heroWidth;
   }
   public int getHeight()
   {
      return heroHeight;
   }
   public int getPower()
   {
     return heroPower;
   }
   public String getName()
   {
     return heroName;
   }
   public color getColor()
   {
     return heroColor;
   }
   public boolean getAttacker()
   {
     return attacker;
   }
   
   public Panel getImgPanel()
   {
     return imgPanel;
   }
   
   //------ Setters ------//
  
   //method to add a scores at the next available location in the scores array   
   public void gainPower(int power)
   {
     heroPower += power;
   }
   
   public void losePower(int power)
   {
     heroPower -= power;
   }
   
   //method to add a scores at the next available location in the scores array   
   public void gainHealth(int health)
   {
     heroHealth += health;
   }
   
   public void loseHealth(int health)
   {
     heroHealth -= health;
   }

   public void setHeight(int heroHeight)
   {
     // Height must be sensible; 
     if ((heroHeight >= minHeight) && (heroHeight <= maxHeight))
     {
        this.heroHeight = heroHeight;
     }
     else
     {
       // Punish bad values by making hero tall ;-)
       this.heroHeight = maxHeight;
     }
   }
  
   public void setName(String name)
   {
      this.heroName = name; 
   }
   
   public void setWidth(int heroWidth)
   {
     //Hero width should be sensible
     if ((heroWidth >= minWidth) && (heroWidth <= maxWidth)){
        this.heroWidth = heroWidth;
     }
     else
     {
       // Punish bad values by making hero wide ;-)
       this.heroWidth = maxWidth;
     }
   }  
   
   public void setXCoord(int xCoord)
   {
     this.xCoord = xCoord;
   }
   
   public void setYCoord(int yCoord)
   {
     this.yCoord = yCoord;
   }
   
   public void setColor(color colour)
   {
     this.heroColor = colour;
   }
   
   public void setAttacker(boolean role)
   {
     this.attacker = role;
   }
   
   public void setImgPanel(Panel panel)
   {
     this.imgPanel = panel;
   }
   
}