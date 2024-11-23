class ball{ 
  //Declare the ball class
  PVector velocity;
  PVector position;
  PVector acceleration;

  ball(){//construct ball class
    
    position = new PVector(random(50, 250),random(150, 200));
    velocity = new PVector(-1,random(-1,-2));
    acceleration = new PVector(0.01, 0.05);
  
  }

void drawball(){
  
  fill(255);
  ellipse(position.x,position.y,10,10);
  
}

void move(){//It is used to increase the value in the ball PVector to achieve the purpose of moving
  
  position.add(velocity);
  
}

void checkedge(board a){//Check whether it meets the ejection standard and perform ejection
  if(position.x > width - 5 || position.x < 5){//Check whether the center of the ball coincides with the left and right borders, and if it does, change the velocity for ejection
    
    velocity.x *= -1;
    
  }if(position.y < 5){//Check whether the center of the ball coincides with the upper boundary, if so change the velocity for ejection
    
    velocity.y *= -1;
    
  }if(position.y > height - 5){//Check whether the center of the ball coincides with the lower boundary. If so, change the position of the ball to reset the position of the ball
    
    position.x =  random(50, 200);
    position.y =  random(150,200);
    
  }if(position.y + 5 >= a.position.y - 5 && position.x > a.position.x -20 && position.x < a.position.x +20){//If the ball coincides with the board, the velocity of the ball is changed and the ejection is performed
    velocity.y *= -1;
    
   }if(position.y + 5 >= a.position.y + 5 && position.x > a.position.x -20 && position.x < a.position.x +20){//If the position of the ball is under the board, change the position to the bottom, and reset the position to avoid bugs
     position.y =  height;
   }//As for this bug, I saw in the video of last week's class that the situation is different from my own. I used the video to add "stament" to reset the ball position and then the ball stuck to the board, 
  }////so I can only solve this bug in this way.
  void blockedge(block[] blocks){//Check collisions with blocks
    for(int a = 0; a < blocks.length; a++){//Because blocks are generated using arrays, we need to go through the groups to check each block.
      if(blocks[a].checkball(position)){//Here we refer to the checkball function in the block to detect the collision between the ball and the block
        
       velocity.y *= -1;
       velocity.add(acceleration);
       
       break;//Exit the loop after ejection to avoid bugs
      }
    }  
  }
 }
