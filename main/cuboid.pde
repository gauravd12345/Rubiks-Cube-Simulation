class Cuboid{
  float size;
  float bdim = 0.5;
  
  float[] matrix;
  float x, y, z;
  

  int[] colorset = {#00FF00, #0000FF, #FF0000,
                    #FFA500, #FFFFFF, #FFFF00,
                    #000000};
             
  
  
  public Cuboid(float size, float[] matrix){
    this.size = size;
    this.matrix = matrix;
    
    this.x = this.matrix[0];
    this.y = this.matrix[1];
    this.z = this.matrix[2];
    
    
  }
  
  public void setMatrix(float[] nmatrix){
    this.matrix = nmatrix;
    this.x = nmatrix[0];
    this.y = nmatrix[1];
    this.z = nmatrix[2];
    
    
  }
  
  
  public float[] getMatrix(){
    return this.matrix;
    
  }
  
  public void drawCuboid(){
      int count = 0;
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 2; k++){
          pushMatrix();

          // Translation to set the face at the position of x, y, z coordinates
          translate(0, 0, this.z - ((bdim * 2) * k) + bdim);

          /* 
            The following translations offset the faces to their correct position
            
          */
          if(j == 1){
            
            // Translation about the Y-axis(Right and Left faces)
            if(k == 0){
              translate(this.x + bdim, 0, -this.x - bdim);  

            }
            else{
              translate(this.x - bdim, 0, -this.x + bdim);

              
            }
            rotateY(-PI/2);
          }
          
          // Translation about the X-axis(Up and Down faces)
          else if(j == 2){
            if(k == 0){
              translate(0, this.y - bdim, this.y - bdim);    
              
            }
            else{
              translate(0, this.y + bdim, this.y + bdim);    
              
            }   
            rotateX(-PI/2);      
          }
          
         
          
          // Array of the verticies & color of the face
          float[] v = {x - bdim, y - bdim, x + bdim, y - bdim, 
                       x + bdim, y + bdim, x - bdim, y + bdim};
          
          //System.out.println((count) + " " + v[0] + " " + v[1] + " " + v[2] + " " +  v[3] + " " +  v[4] + " " + v[5] + " " + v[6] + " " + v[7]);
          fill(this.colorset[k + (j * 2)]);
          //System.out.println(count + " " + (this.z - ((bdim * 2) * k)));
          
          
          // Drawing the face onto the screen

          quad(v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7]);
          
          count++;
          popMatrix();
  
       
        }

      }
      
    
  }
  
 
  void setColorSet(int index, int clr){
    this.colorset[index] = clr;
  
  
  }
  
  public int[] getColorSet(){
    return this.colorset;
    
  }
  
  
  
  
  
  
}
