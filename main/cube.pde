class Cube{
  int ct = 0;
  Cuboid[] Cube = new Cuboid[int(size * size * size)];
  
  
  // Constructor for the Cube class
  public Cube(){
      /* 
      Creating the actual cube:
        Each loop is for each dimension
        Each group of numbers in the loop(Ex: x = 1, y = 0, z = -1)
          refers to the cuboid's coordinates
          
        Each cuboid is then added to the cube
    */
  
  
    for(float z = dist; z >= -dist; z--){
      for(float y = -dist; y <= dist; y++){
        for(float x = -dist; x <= dist; x++){
          float[] matrix = {x, y, z};
          
          Cuboid cube = new Cuboid(size, matrix);
  
          Cube[ct] = cube; 
          
          ct++;
          
        }
        
        
      }
      
    
    }

  }
  
  
  // Returns the Cube object
  public Cuboid[] getCube(){
    return this.Cube;
    
  }
  
  
  
  public void turnX(int dir){
    int off = 0;
    int rot_face = 2;
    if(dir == 1){
      off = -int(size - 1);
      rot_face = 3;
      
    }
    
    int[] left_1 = new int[int(size)];
    int[] left_2 = new int[int(size)];
    
    int[] right_1 = new int[int(size)];
    int[] right_2 = new int[int(size)];
    
    int[] front_1 = new int[int(size)];
    int[] front_2 = new int[int(size)];
    
    int[] back_1 = new int[int(size)];
    int[] back_2 = new int[int(size)];
    
    
    for(int i = 0; i < size; i++){
      left_1[i] = Cube[(int(size * size) * (i + 1)) - 1 + off].getColorSet()[5];
      left_2[i] = Cube[(int(size * size) * (i + 1)) - 1 + off].getColorSet()[rot_face];
      
      right_1[i] = Cube[int(size * size * i) + int(size - 1) + off].getColorSet()[4];
      right_2[i] = Cube[int(size * size * i) + int(size - 1) + off].getColorSet()[rot_face];
      
      front_1[i] = Cube[int(size * size) + 1 - ((i * int(size)) + int(size - 1)) + off].getColorSet()[0];
      front_2[i] = Cube[int(size * size) + 1 - ((i * int(size)) + int(size - 1)) + off].getColorSet()[rot_face];
      
      back_1[i] = Cube[((i * int(size)) + int(size - 1) + int(size * size * (size - 1))) + off].getColorSet()[1];
      back_2[i] = Cube[((i * int(size)) + int(size - 1) + int(size * size * (size - 1))) + off].getColorSet()[rot_face];
      
    }
    
    for(int i = 0; i < int(size); i++){
      // Left Side
      Cube[((i * int(size)) + int(size - 1)) + off].setColorSet(0, left_1[i]);
      Cube[((i * int(size)) + int(size - 1)) + off].setColorSet(rot_face, left_2[i]);
      
      // Right Side
      Cube[((i * int(size)) + int(size - 1) + int(size * size * (size - 1))) + off].setColorSet(1, right_1[i]); 
      Cube[((i * int(size)) + int(size - 1) + int(size * size * (size - 1))) + off].setColorSet(rot_face, right_2[i]); 
      
      // Front Side
      Cube[int(size * size * i) + int(size - 1) + off].setColorSet(4, front_1[i]);  
      Cube[int(size * size * i) + int(size - 1) + off].setColorSet(rot_face, front_2[i]);  
      
      // Back Side
      Cube[int(size * size * (size + 1)) - (int(size * size) * (i + 1)) - 1 + off].setColorSet(5, back_1[i]);   
      Cube[int(size * size * (size + 1)) - (int(size * size) * (i + 1)) - 1 + off].setColorSet(rot_face, back_2[i]);
      
      
    }
    

  }
  
  public void turnY(int dir){
    int off = 0;
    int rot_face = 4;
    if(dir == 1){
      off = int(size * (size - 1));
      rot_face = 5;
    }
    
    int[] left_1 = new int[int(size)];
    int[] left_2 = new int[int(size)];
    
    int[] right_1 = new int[int(size)];
    int[] right_2 = new int[int(size)];
    
    int[] front_1 = new int[int(size)];
    int[] front_2 = new int[int(size)];
    
    int[] back_1 = new int[int(size)];
    int[] back_2 = new int[int(size)];
    
    for(int i = 0; i < size; i++){
      left_1[i] = Cube[int(size - 1) - i + off].getColorSet()[0];
      left_2[i] = Cube[int(size - 1) - i + off].getColorSet()[rot_face];
      
      right_1[i] = Cube[2 - i + int(size * size * (size - 1)) + off].getColorSet()[1];
      right_2[i] = Cube[2 - i + int(size * size * (size - 1)) + off].getColorSet()[rot_face];
      
      front_1[i] = Cube[int(size * size * i) + int(size - 1) + off].getColorSet()[2];
      front_2[i] = Cube[int(size * size * i) + int(size - 1) + off].getColorSet()[rot_face];
      
      back_1[i] = Cube[(i * int(size * size)) + off].getColorSet()[3];
      back_2[i] = Cube[(i * int(size * size)) + off].getColorSet()[rot_face];
    }
    
    
    for(int i = 0; i < int(size); i++){
      // Left Side
      Cube[(i * int(size * size)) + off].setColorSet(3, left_1[i]);
      Cube[(i * int(size * size)) + off].setColorSet(rot_face, left_2[i]);
      
      //Right Side
      Cube[int(size - 1) + i * int(size * size) + off].setColorSet(2, right_1[i]);
      Cube[int(size - 1) + i * int(size * size) + off].setColorSet(rot_face, right_2[i]);
      
      // Front Side
      Cube[i + off].setColorSet(0, front_1[i]); 
      Cube[i + off].setColorSet(rot_face, front_2[i]); 
      
      // Back Side
      Cube[i + int(size * size * (size - 1)) + off].setColorSet(1, back_1[i]); 
      Cube[i + int(size * size * (size - 1)) + off].setColorSet(rot_face, back_2[i]); 
      
    }
    
  }
  
  public void turnZ(int dir){

    // Deciding if the turn is an "F" or a "B"
    int off = 0;
    int rot_face = 0;
    if(dir == 1){
      off = int(size * size * 2);
      rot_face = 1;
      
    }
    
    /* 
      Saving the colors of the final side:
         Originally, if the sides are rotated all under one loop,
         the rotation for the last sides will conflict with each other.
         And so, one side's colors are saved so they can be used later
         without conflicting with the other sides
    
   */

    int[] left_1 = new int[int(size)];
    int[] left_2 = new int[int(size)];
    
    int[] right_1 = new int[int(size)];
    int[] right_2 = new int[int(size)];
    
    int[] front_1 = new int[int(size)];
    int[] front_2 = new int[int(size)];
    
    int[] back_1 = new int[int(size)];
    int[] back_2 = new int[int(size)];
    
    
    for(int i = 0; i < size; i++){
      left_1[i] = Cube[(int((size - 1) * (size - 1) * (size - 1)) - i) + off].getColorSet()[5];
      left_2[i] = Cube[(int((size - 1) * (size - 1) * (size - 1)) - i) + off].getColorSet()[rot_face];
      
      right_1[i] = Cube[i + off].getColorSet()[4];
      right_2[i] = Cube[i + off].getColorSet()[rot_face];
      
      front_1[i] = Cube[int(size * (size - 1)) - (i * int(size)) + off].getColorSet()[3];
      front_2[i] = Cube[int(size * (size - 1)) - (i * int(size)) + off].getColorSet()[rot_face];
      
      back_1[i] = Cube[((i * int(size)) + int(size - 1)) + off].getColorSet()[2];
      back_2[i] = Cube[((i * int(size)) + int(size - 1)) + off].getColorSet()[rot_face];
    }
    
    
    // Rotating the last side with the saved colors
    for(int i = 0; i < int(size); i++){
      // Left Side
      Cube[((int(size - 1) - i) * int(size)) + off].setColorSet(3, left_1[i]);
      Cube[((int(size - 1) - i) * int(size)) + off].setColorSet(rot_face, left_2[i]);
      
      // Right Side
      Cube[((i * int(size)) + int(size - 1)) + off].setColorSet(2, right_1[i]);
      Cube[((i * int(size)) + int(size - 1)) + off].setColorSet(rot_face, right_2[i]);
      
      // Front Side
      Cube[i + off].setColorSet(4, front_1[i]);   
      Cube[i + off].setColorSet(rot_face, front_2[i]); 
      
      // Back Side
      Cube[(int((size - 1) * (size - 1) * (size - 1)) - i) + off].setColorSet(5, back_1[i]);
      Cube[(int((size - 1) * (size - 1) * (size - 1)) - i) + off].setColorSet(rot_face, back_2[i]);
    }
    
  }
  

}
