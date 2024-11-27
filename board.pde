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
 
boolean Checkskill(block skill) {
    if(skill.Skillcheck && skill.position.y + 10 >= position.y - 5 && skill.position.x > position.x - 20 && skill.position.x < position.x + 20 ){
      skill.Skillcheck = false;
      return true;
    }
    if (skill.position.y > position.y + 5) {
        skill.Skillcheck = false;
    }
    return false;
  }
}
  
