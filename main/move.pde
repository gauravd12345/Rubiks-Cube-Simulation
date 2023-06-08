void keyPressed(){
  isAnimating = true;
  
  
  
}

String[] getMoves(String algorithm){
  String[] movelist = algorithm.split(" ");
  for(int i = 0; i < movelist.length; i++){
    if(movelist[i].contains("2")){
      angle = PI;
      
    }
    else{
      angle = PI/2;
      
    }
      
    
  }
  
 return movelist;
  
  
}

void moveFace(String move){
    if(isTurning){
      if(move.equals("f")){cube.turnZ(0);}
      else if(move.equals("f'")){cube.turnZ(0); cube.turnZ(0); cube.turnZ(0);  }
      else if(move.equals("f2")){cube.turnZ(0); cube.turnZ(0); }
      else if(move.equals("b")){cube.turnZ(1);  cube.turnZ(1);  cube.turnZ(1); }
      else if(move.equals("b2")){cube.turnZ(1); cube.turnZ(1); }
      else if(move.equals("b'")){cube.turnZ(1);} 
      else if(move.equals("r")){cube.turnX(0); }
      else if(move.equals("r2")){cube.turnX(0); cube.turnX(0); }
      else if(move.equals("r'")){cube.turnX(0); cube.turnX(0);  cube.turnX(0); }
      else if(move.equals("l")){ cube.turnX(1); cube.turnX(1);  cube.turnX(1); } 
      else if(move.equals("l2")){cube.turnX(1); cube.turnX(1); }
      else if(move.equals("l'")){cube.turnX(1); }
      else if(move.equals("u")){ cube.turnY(0); }
      else if(move.equals("u2")){cube.turnY(0); cube.turnY(0); }
      else if(move.equals("u'")){cube.turnY(0); cube.turnY(0);  cube.turnY(0); }
      else if(move.equals("d")){ cube.turnY(1); cube.turnY(1);  cube.turnY(1); }
      else if(move.equals("d2")){cube.turnY(1); cube.turnY(1); }
      else if(move.equals("d'")){cube.turnY(1); }
      
    }
    isTurning = false;

  

  
  
  

}
