class block{//Declare the block class
  
  PVector position;
  boolean alive;
  
  int health; 

  block(){//construct block class
    
    position = new PVector(random(50,350),random(200));
    alive = true;//Setting block is showed in the first time 
    health = 1;//Set the health value to 1 to facilitate the operation of the box disappearing after the collision
  }
  
  void drawblock(){
  if(alive == true){//Draw blocks according to their position when the ball does not touch the block
    
    float wallX = position.x;
    float wallY = position.y;
  //Here is the function for drawing blocks 
  fill(170);
  stroke(0,0);
  rect(wallX,wallY+3,27,21);
  
  fill(120);
  rect(wallX+9,wallY+9,3,9);
  rect(wallX+14,wallY+18,6,3);
  rect(wallX+23,wallY+18,3,3);
  
  
  fill(100);
  rect(wallX,wallY,27,3);
  rect(wallX,wallY+21,3,3);
  rect(wallX-3,wallY+3,3,21);
  rect(wallX-3,wallY+24,33,3);
  rect(wallX+27,wallY+3,3,21);
    }
  }
  boolean checkball(PVector ballposition){
    
  if(alive == true){
    if (ballposition.x + 5 > position.x && ballposition.x - 5 < position.x + 27 && ballposition.y + 5 > position.y && ballposition.y - 5 < position.y + 24){
      //Check to see if the ball's position coincides with the edge of the block, and subtract health if it does
     health -- ;//In fact, it was originally changed to false directly, I don't know why it doesn't take effect because the block will not disappear after colliding with the ball, 
     //so the addition of health adds a step of judgment, and now the block will disappear normally.
     //I still don't know the reason, and I hope you can help me answer it in the assessment comments
      if(health <= 0 ){
       alive = false;
     }
     return true;//A collision is declared when the ball overlaps with the block
    }
   }
   return false;//It has to have a return value so if it's not true, it returns false
  }
  
 }