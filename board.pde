class board{//Declare the board class
  
  PVector position;
  
  board(float x,float y){//construct board class
  position = new PVector(x,y);
  
  }
  
void drawboard(){
  
  fill(200);
  rectMode(CENTER);
  rect(position.x,position.y,40,10);
  
 }
  
}
  
