class Animate{
  float[] rotation_list = new float[int(size * size * size)];
  
  
  public Animate(){
    for(int i = 0; i < (size * size * size); i++){
      this.rotation_list[i] = 0;
      
    }
    
  }
  
  
  public float[] getRotation(){
    return this.rotation_list;
    
  }
  
}
