class Walker {
  int x,y,r_col,g_col,b_col;
  // initialising step
  Walker(){
    x = width/2;
    y = height/2;
    r_col = 255/2;
    g_col = 255/2;
    b_col = 255/2;
  }
  // render function
  void render(){
    stroke(r_col,g_col,b_col);
    point(x,y);
  }
  
  //what happens at each iteration of the draw loop
  void step(){
    int choice = int(random(4));
    
    if (choice==0){
      x++;
      r_col++;
    } else if (choice==1){
      x--;
      r_col--;
    } else if (choice==2){
      y++;
      g_col++;
    } else {
      y--;
      g_col--;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
    r_col = constrain(r_col,0,255);
    g_col = constrain(g_col,0,255);
    b_col = constrain(b_col,0,255);
  }
  
}
