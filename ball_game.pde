board board1;
block block1;
float hitboxW = 100;
float hitboxH = 30;
float hitboxSX = 200;
float hitboxSY = 200;
boolean leftmove;
boolean rightmove;
boolean active;
boolean gameover;
PVector location;
PVector velocity;
String i = "Start";
ArrayList<ball> balls = new ArrayList<ball>(); //Set ball array
block[] blocks = new block[11];//set block array
void setup(){
  //set size
 size(400,400);
 
 
 rectMode(CENTER);//Change the rectangle mode to center
  background(0,0,107);//Draw a blue background
  //ground
  fill(149,127,81);//Set the fill color of the graph to brown
  rect(200,360,400,80);//Draw a yellow ground
 
 leftmove =false;//Initializes the movement Control
 rightmove = false;//Initializes the movement Control
 
 location = new PVector(100,300);//Set the initial position of the board
 velocity = new PVector(0,0);//Initialization board speed

 board1 = new board(location.x,location.y);//Declare the board1 is board class
 
 active = false;
 gameover = false;
 //Initialize block array
 for(int a = 0; a < blocks.length; a++){
   blocks[a] = new block();
 }
 //Initialize ball array
 for (int i = 0; i < 1; i++) {//I actually want to make a catch prop to increase the ball prop, but the prop generation has not done well.
   
   balls.add(new ball()); 
   
  }
 }

void draw(){
  //game mian UI---------------------------------------------------------------------------
  if(gameover == false && active == false){
  
  fill(255);
  rect(hitboxSX, hitboxSY, hitboxW, hitboxH);
  fill(0);
  text(i,238,211,100,30);
  }
  
  
  //game start----------------------------------------------------------------------------
  if(active == true){
  rectMode(CENTER);//Change the rectangle mode to center
  background(0,0,107);//Draw a blue background
  //ground
  fill(149,127,81);//Set the fill color of the graph to brown
  rect(200,360,400,80);//Draw a yellow ground
  //drawboard
  board1.drawboard();//draw board
  

  
  rectMode(CORNER);//I copied this box code directly from the previous assignment, when I used rectmode as Corner
  
  
  //drawblocks
  for(int a = 0; a < blocks.length; a++){//Iterating through an array of blocks with a for loop generates 11 blocks
  blocks[a].drawblock();//Because the number in the array replaces A or A is now facilitating the array it's equivalent to drawblock running 11 times
  }
  
  //draw balls
  for (int i = 0; i < balls.size(); i++) {//Use the for loop to iterate through the group to generate the ball
    
    balls.get(i).drawball();//Reference the braw in the ball class to draw the position of the ball
    balls.get(i).move();//Update the position of the ball by referring to the move function in the ball class
    balls.get(i).checkedge(board1);//Reference the checkedge function in the ball class to determine if the ball is in contact with the board and wall
    balls.get(i).blockedge(blocks);//Reference the checkedge function in the ball class to determine if the ball is in contact with the block
  }
  
  //ground
  rectMode(CENTER);
  fill(149,127,81);
  //Because there is no way to solve the bug that the ball is directly under the board, the move function of the ball class added the decision that if the ball is directly under the board，
  //it will immediately send to the bottom of the screen to reset the ball, but because the animation is too abrupt, a layer of ground was added to hide it.
  rect(200,360,400,80);
  //leftmove
  if(leftmove == true){//Use boolean to control the move of board.
    
    velocity.x = -3;
    
  }
  //rightmove
  else if(rightmove == true){//Use boolean to control the move of board.
  
   
    velocity.x = 3;
  
  }
  //stop
  else{//Change the speed to zero without pressing any buttons, so it doesn't move
   
    velocity.x = 0;
   
  }
   //Refreshing the board Position
  location.add(velocity);//Increasing the value of velocity on the location of the board has achieved the purpose of moving
 
  board1.position.x = location.x;//Control X movement
 
}

//game over UI-----------------------------------------------------------------------------------
if(gameover == true && active == false){


 
  }
}


void keyPressed(){
  //lift move
  if(key == 'a'){//Press A key to control the change of Boolean value to achieve the purpose of moving to the left
    
    leftmove = true;
    rightmove = false;
   //right move
  }else if(key == 'd'){//Press D key to control the change of Boolean value to achieve the purpose of moving to the right
   
    rightmove = true;
    leftmove = false;
    
      }
  
  }
//Reset Boolean to stop board



void keyReleased(){
  
  leftmove = false;
  rightmove = false;
  
}

void mousePressed(){
if (mouseX <= hitboxSX+hitboxW && mouseX > hitboxSX && mouseY <= hitboxSY + hitboxH && mouseY > hitboxSY) {
    
  active = true;

  } 

}
