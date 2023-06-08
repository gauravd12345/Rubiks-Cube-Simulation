import peasy.*;

PeasyCam cam;

// Setting cube dimension and distance from the center
float size = 3;
float dist = (size - 1) / 2;


// Initializing base cube
Cube cube = new Cube();

  
// List representing color values
// Order: G, B, R, O, W, Y 
int[] CLR = {#00FF00, #0000FF, #FF0000,
             #FFA500, #FFFFFF, #FFFF00};
                        
                          
// Creating variables for rotation animation
int alg_step = 0;
String alg = ("R U R' U' R' F R2 U' R' U' R U R' F'").toLowerCase();
String[] movelist = alg.split(" ");
float angle = PI/2;
boolean isAnimating = false;
boolean isTurning = false;
float angle_rotation_speed = 4;
float[] rlist = new float[int(size * size * size)];

void setup(){
  // Creating P3D window 
  size(750, 750, P3D);
  surface.setTitle("Rubik's Cube Simulator");
  
  // Creating PeasyCam camera
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(90);
  cam.setMaximumDistance(300);
  for(int i = 0; i < 27; i++){
    rlist[i] = 0;
  
  }
  
  

}



void draw(){
  background(200);
  
  // Setting the scale and stroke-weight of each cuboid
  float nscale = (width + height) / 130;
  scale(nscale);
  strokeWeight(0.5);
  
  if(alg_step < movelist.length){
      movelist = getMoves(alg);
      
  }
    
  // Drawing out each cuboid
  int dir = 1;
  for(int i = 0; i < (size * size * size); i++){

    
    pushMatrix();
    
    String move = String.valueOf(key);
    if(alg_step < movelist.length){
       isAnimating = true;
       move = movelist[alg_step];
       if(move.contains("2")){
         angle = PI;
       }
       else if(move.contains("'")){
         dir = -1;
         
         
       }
       else{
         angle = PI/2;
       }
    }
    
    if(isAnimating){
      if(rlist[i] < angle){
        if(move.contains("f")){
          if(cube.getCube()[i].z != 1){
            rlist[i] = 0;
            
          }
          else{
            rotateZ(dir * rlist[i]);
            
          }
            
        }
        
        else if(move.contains("b")){
          if(cube.getCube()[i].z != -1){
            rlist[i] = 0;
            
          }
          else{
            rotateZ(-dir * rlist[i]);
            
          }
        }
        
        else if(move.contains("u")){
          if(cube.getCube()[i].y != -1){
            rlist[i] = 0;
            
          }
          else{
            rotateY(-dir * rlist[i]);
            
          }
          
        }
        
        else if(move.contains("d")){
          if(cube.getCube()[i].y != 1){
            rlist[i] = 0;
            
          }
          else{
            rotateY(dir * rlist[i]);
            
          }
          
        }
        
        else if(move.contains("r")){
          if(cube.getCube()[i].x != 1){
            rlist[i] = 0;
            
          }
          else{
            rotateX(dir * rlist[i]);
            
          }
          
        }
        
        else if(move.contains("l")){
          if(cube.getCube()[i].x != -1){
            rlist[i] = 0;
            
          }
          else{
            rotateX(-dir * rlist[i]);
            
          }
          
        }
        
        rlist[i] += radians(angle_rotation_speed);
        
        
      }
      
      else{
        
        // Here the animation is completed
        alg_step++;
        for(int j = 0; j < 27; j++){
          rlist[j] = 0;
        
        }
        isAnimating = false; 
        isTurning = true;     
        moveFace(move);        
        
   
      }
      
      
      

    }
    
    else{
      rlist[i] = 0;
      
    }
    
    

    
    cube.getCube()[i].drawCuboid();
    popMatrix();
    
  }

  
  
}
