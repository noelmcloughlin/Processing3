// THE BOOK OF INVASIONS & BATTLE FOR IRELAND //<>//
//
// YOU ARE THE TUATH DE DANNAN, RULER OF IRELAND. BUT ENEMIES GATHER.
// YOU MUST STAY ALIVE LONG ENOUGH TO DEFEAT THE FORMORIANS AND FIRBOLG.
// THIS IS BASICALLY A DODGEBALL GAME
//
// v1.0 basic version handed in
// v1.01 Bigger screen/stones for improved gamer experience

import javax.swing.JOptionPane;

//Battle objects
Stone danuStone, formoireStone, firbolgStone;
Hero danu, firbolg, formoire;
Player player;

//Battle Imagery objects
Panel danuHealthPanel;
Panel formoireHealthPanel;
Panel firbolgHealthPanel;
Panel console;
Panel ireland;
private final color blue = color(0, 173, 239);
private final color red = color(236, 40, 78);
private final color green = color(141, 199, 63);
//private final color orange = color(255,191,34);
private final color white = color(255, 255, 255);

//display attributes
float background=0;
final int displayWidth=1400;
final int displayHeight=800;
final int middleX=displayWidth/2;
final int consoleY = 280;

//Battle attributes
int attackers = 2;
int livesLost = 0;             //keeps track of the number of lives lost in the current battle
int score = 0;                 //high score of the current battle
int maxLivesPerBattle = 3;     //max lives that can be lost before the battle ends

//war data
int maxBattles=10;          //maximum number of battles in a war
int battlesFought = 0;   //number of battles played, so far, in the war

void settings()
{
  size(displayWidth, displayHeight);
  //pixelDensity(2);
}

void setup()
{
  background(white);
  imageMode(CORNERS);
  //frameRate(5);

  //ireland = new Panel(middleX-50, height-100, middleX+50, height, "http://tuaths.surge.sh/ireland100.png");
  console = new Panel(0, consoleY, width, height, white);

  //As proof of concept, hard coded values are okay (for now). Anyway some must be hardcoded.
  danu = new Hero(20, 100, blue, false, new Panel(0, 0, 200, consoleY, "http://tuaths.surge.sh/danu.png"));
  firbolg = new Hero(20, 100, green, true, new Panel(237, 0, 437, consoleY, "http://tuaths.surge.sh/firbolg.png"));
  formoire = new Hero(20, 100, red, true, new Panel(475, 0, 675, consoleY, "http://tuaths.surge.sh/formoire.png"));

  danuStone = new Stone(80.0, danu.getXCoord(), displayHeight-danu.getHeight(), blue);
  firbolgStone = new Stone(80.0, firbolg.getXCoord(), displayHeight-firbolg.getHeight(), green);
  formoireStone = new Stone(80.0, formoire.getXCoord(), displayHeight-formoire.getHeight(), red);

  //create a player object with the data entered by the user
  JOptionPane.showMessageDialog (null, "The Tuath De Dannan rule Ireland but FORMORIANS and FIRBOLG have started a War!!\n"
             + "The Battle of the Magic Stones has started in the War for Ireland. To win battles, you must \n"
             + "*DODGE* enemy GREEN and RED Stones until your BLUE Stone kills your foes.", "Game objective", JOptionPane.INFORMATION_MESSAGE);
             
  maxBattles = Integer.parseInt(JOptionPane.showInputDialog("The Irish Book of Invasions (aka DodgeBall)\n\n How many battles were fought: ", "2"));
  player = new Player("Danu", maxBattles);
}

void draw()
{
  console.clear();
  
  //firbolg and formoire (Attackers) do not move.
  firbolg.display();
  formoire.display();
  
  //Danu (our hero) must move to dodge enemy balls (motive of game).
  danu.update();     //Update the hero location towards cursor
  danu.display();    //Draw the hero in this new location
  
  //Update currnet stone location
  danuStone.update();
  firbolgStone.update();
  formoireStone.update();

  // If player is alive in current battle - continue; update situation
  // Check for battle victory & defeat for each Irish tribal hero
  if (livesLost < maxLivesPerBattle) 
  { 
    danuStone.display();
    firbolgStone.display();
    formoireStone.display();

    // Tuath De Dannan defeated Formoire?
    if (hitHero(formoire, danuStone))
    {
      danuStone.update(danu.xCoord, height-danu.getHeight()*2);
      danu.gainPower(1);
      danu.gainHealth(danu.getHealth());
      formoire.losePower(1);
      formoire.loseHealth(formoire.getHealth());
      score++;
    }

    // Tuath De Dannan defeated Firbolg?
    if (hitHero(firbolg, danuStone))
    {
      danuStone.update(danu.xCoord, height-danu.getHeight()*2);
      danu.gainPower(1);
      danu.gainHealth(danu.getHealth());
      firbolg.losePower(1);
      firbolg.loseHealth(firbolg.getHealth());
      score++;
    }

    // Firbolg defeated Tuath De Dannan?
    if (hitHero(danu, firbolgStone))
    {
      firbolgStone.update(firbolg.xCoord, height-firbolg.getHeight());
      firbolg.gainPower(1);
      firbolg.gainHealth(firbolg.getHealth());
      danu.losePower(1);
      danu.loseHealth(danu.getHealth());
      livesLost++;
    }

    // Formoire defeated Tuath De Dannan?
    if (hitHero(danu, formoireStone))
    {
      formoireStone.update(formoire.xCoord, height-formoire.getHeight()*2);
      formoire.gainPower(1);
      formoire.gainHealth(formoire.getHealth());
      danu.losePower(1);
      danu.loseHealth(1);
      livesLost++;
    }

    // Firbolg hit Formoire ally; their power/health is not improved.
    if (hitHero(formoire, firbolgStone))
    {
      firbolgStone.update(firbolg.xCoord, height-firbolg.getHeight()*2);
      formoire.losePower(1);
      formoire.loseHealth(formoire.getHealth());
    }

    // Formoire stone hit Firbolg ally; their power/health is not improved.
    if (hitHero(firbolg, formoireStone))
    {
      formoireStone.update(formoire.xCoord, height-formoire.getHeight()*2);
      firbolg.losePower(1);
      firbolg.loseHealth(formoire.getHealth());
    }
  } 
  else 
  {
    //No more lives for Player in current battle
    player.addScore(score);
    battlesFought++;        
    //Allow further battles or quit (prompt for response)!
    if (battlesFought < maxBattles) 
    {
      int reply = JOptionPane.showConfirmDialog(null, "Battle Over! Score " + score + ".\nPlay more or quit?", "Play next battle?", JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) 
      {
        // next battle
        resetBattle();
      } else 
      {
        //player chooses to quit
        warOver();
      }
    } else 
    {
      //the player has no more battles
      warOver();
    }
  }
}

//Prepare for battle by reseting the current battle information.
void resetBattle()
{
  livesLost = 0;          //resets the lives lost in the current battle to zero
  score = 0;              //resets the score of the current battle to zero
}

//method displays the player information, high scores and statistics, before exiting the program.
void warOver()
{
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", War is over! \n\n"  
    + "Number of battles played: " + battlesFought
    + "\n\n"                     + player.toString()
    + "\n\nHighest Score: "      + player.highestScore()
    +   "\nLowest Score:  "      + player.lowestScore()
    +   "\nAverage Score: "      + player.averageScore());
  exit();
}


//method returns true if the stone and hero overlap (i.e. stone is hit), false otherwise.
boolean hitHero(Hero hero, Stone stone)
{
  //These variables measure the magnitude of the gap between the hero and the stone.  
  float circleDistanceX = abs(stone.getXCoord() - hero.getXCoord() - hero.getWidth()/2);
  float circleDistanceY = abs(stone.getYCoord() - hero.getYCoord() - hero.getHeight()/2);

  if (circleDistanceX > (hero.getWidth()/2  + stone.getDiameter()/2)) 
  { 
    return false;
  }
  if (circleDistanceY > (hero.getHeight()/2 + stone.getDiameter()/2)) 
  { 
    return false;
  }

  if (circleDistanceX <= (hero.getWidth()/2)) 
  { 
    return true;
  }
  if (circleDistanceY <= (hero.getHeight()/2))
  { 
    return true;
  } 

  float cornerDistance = pow(circleDistanceX - hero.getWidth()/2, 2) + pow(circleDistanceY - hero.getHeight()/2, 2);
  if (cornerDistance <= pow(stone.getDiameter()/2, 2)) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}