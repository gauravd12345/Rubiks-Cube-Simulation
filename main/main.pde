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
                          


void setup(){
  // Creating P3D window 
  size(750, 750, P3D);
  surface.setTitle("Rubik's Cube Simulator");
  
  // Creating PeasyCam camera
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(90);
  cam.setMaximumDistance(300);
  
  //runAlgo("   R U R' U' R' F R2 U' R' U' R U R' F'   ");

}



void draw(){
  background(200);
  
  // Setting the scale and stroke-weight of each cuboid
  float nscale = (width + height) / 130;
  scale(nscale);
  strokeWeight(0.5);
  
  
  
  // Drawing out each cuboid
  for(int i = 0; i < (size * size * size); i++){
    (cube.getCube())[i].drawCuboid(); 
      
    
  
  }
  
  
  
}
