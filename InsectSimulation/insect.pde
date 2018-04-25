class Insect {

  //attributes
  private String name = "Sammy";
  private int legs = 6;
  private int velocity = 2;
  private float x=(width/2), y=(height/2);
  private float diameter;

  //attribute boundary constants
  private int maxName = 8;
  private int minName = 3;
  private int maxLegs = 8;
  private int minLegs = 4;
  private int minVelocity = 5;
  private int maxVelocity = 10;
  private int minX = 0;
  private int maxX = width-(width/10);
  private int minY = 0;
  private int maxY = height-(height/10);
  
  //atribute behaviours
  private float xstep;
  private float ystep;
  
  //------ Constructors -----//
  
  public Insect() {
  }
  
  public Insect(String name) {
    this(name, 0, 0, 0, 0, 0);
  }
  
  public Insect(String name, int legs) {
    this(name, legs, 0, 0, 0, 0);
  }
  
  public Insect(String name, int legs, int velocity) {
    this(name, legs, velocity, 0, 0, 0);
  }
  
  public Insect(String name, int legs, int velocity, float x) {
    this(name, legs, velocity, x, 0, 0);
  }
  
  public Insect(String name, int legs, int velocity, float x, float y) {
    this(name, legs, velocity, x, y, 0);
  }
  
  public Insect(String name, int legs, int velocity, float x, float y, int diameter) {
    setName(name);
    setLegs(legs);
    setVelocity(velocity);
    setDiameter(diameter);
    setX(x);
    setY(y);
  }
  
    //------ Getters ------//
    
    public String getName() {
      return this.name;
    }
    public int getMinName() {
      return this.minName;
    }
    public int getMaxName() {
      return this.maxName;
    }
    public int getLegs() {
      return this.legs;
    }
    public int getMinLegs() {
      return this.minLegs;
    }
    public int getMaxLegs() {
      return this.maxLegs;
    }
    public int getVelocity() {
      return this.velocity;
    }
    public int getMinVelocity() {
      return this.minVelocity;
    }    
    public int getMaxVelocity() {
      return this.maxVelocity;
    }
    public float getX() {
      return this.x;
    }
    public float getY() {
      return this.y;
    }
    public float getDiameter() {
      return this.diameter;
    }
    public int getMinX() {
      return this.minX;
    }
    public int getMaxX() {
      return this.maxX;
    }
    public int getMinY() {
      return this.minY;
    }
    public int getMaxY() {
      return this.maxY;
    }
    public float getXstep() {
      return this.xstep;
    }
    public float getYstep() {
      return this.ystep;
    }
 
  //------ Setters ------//
  
  public void setLegs(int legs) 
  {
    int max = this.getMaxLegs();
    int min = this.getMinLegs();

    if (legs > max) {
      legs = max;       // too many legs, default to max
    } 
    else if (legs < min) {
      legs = min;        // too few legs, default to min
    }
    
    // set legs property for instect
    this.legs = legs;    // good legs value
  }
  
  public void setName(String name) 
  {
    int min = this.getMinName();
    int max = this.getMaxName();
    int len = name.length();
    
    //Check name is within length constraints
    if (len < min) {   
      for (int i = len; i < min ; i++)  //too short, stuff in random chars
      {
        char c = (char) int(random(97, 122));   // cast random int to ascii char
        name += c;
      }
    } 
    else if (len > max) {
      name = name.substring(max);    // too long, truncate extra stuff
    }
    
    // set name property of instance
    this.name = name;
  }
  
  public void setVelocity(int velocity) 
  {
    int max = this.getMaxVelocity();
    int min = this.getMinVelocity();
    
    //check, and adjust, velocity speed constraints
    if (velocity > max) {
      velocity = max;
    } 
    else if (velocity < min) {
      velocity = min;
    }
    
    // set velocity parameter of instance
    this.velocity = velocity;
  }
  
  public void setX(float x)
  {    
    float xCoord = getX();
    
    //set X parameter of instance
    this.x = x;
    
    //nudge inwards if positoned near top/bottom
    if (xCoord < this.diameter) {
      this.x++;
    }
    else if (xCoord > (width-this.diameter)) {
      this.x--;
    }    
    else if (xCoord > width) {
     this.x = width/10;
   }
  }
  
  public void setY(float y)
  {    
    float yCoord = getY();
    
    //set Y parameter of instance
    this.y = y;
    
    //nudge inwards if positoned near top/bottom
    if (yCoord < this.diameter) {
      this.y++;
    }
    else if (yCoord > height-this.diameter) {
      this.y--;
   }
   else if (yCoord > height) {
     this.y = height/10;
   }
  }
    
  public void setDiameter(int diameter) 
  {    
    //check diameter of constraints
    if (diameter > width/2) {
      diameter = width/population;
    }
    else if (diameter > height/2) {
      diameter = height/population;
    }
      
    //Set diameter parameter for instance
    this.diameter = diameter;
  } 
    
  //------ private methods -----//
  
  private void displayLegs(float radius)
  {
    int legs = getLegs();
    float x = getX();
    float y = getY();
    
    // Draw imperfect things resembling legs.
    noFill();
    stroke(255, 102, 0);
    for (int i=0; i < legs/2; i++)
    {
      line(x, y, x-radius*2, y+radius*2*random(i)/i);
      line(x, y, x+radius*2, y+radius*2*random(i)/i);
    }
  }
  
  private void displayTorso(float radius)
  {
    float x = this.getX();
    float y = this.getY();
    
    stroke(125);
    fill(255);
    // 3D technique from https://tinyurl.com/ybalglzm
    lights();
    
    // draw body and head
    translate(x, y);
    sphere(radius);
    translate(0, radius);
    sphere(radius/2);
  }
  
  //--------- public methods---------//
  
  public void display()
  {    
    float diameter = getDiameter();
    displayLegs(diameter/2);
    displayTorso(diameter/2);
  }
  
  public void randomWalk()
  {
    float x = getX();
    float y = getY();
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    
    setX(x + stepx);
    setY(y + stepy);
  }
  
}