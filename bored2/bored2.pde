   
  // Example 16-6: Drawing a grid of squares
  
  // Size of each cell in the grid, ratio of window size to video size
  // 80 * 8 = 640
  // 60 * 8 = 480
  int videoScale = 80;
  //current is starting size of each circle
  int current = 50;
  
  // Number of columns and rows in our system
  int cols, rows;
  PFont f;
  
  void setup() {
    size(960,720);
    frameRate(1);
    f = createFont("Book Antiqua",20,true);
    // Initialize columns and rows
    cols = width/videoScale;
    rows = height/videoScale;
    background(204,153,0 );
    noLoop();
  }
  
    void draw() {
      
      // Begin loop for columns
          for(int i = 0; i < cols; i++){
          
        // Begin loop for rows
          for(int j = 0; j < rows; j++){
          
          // Scaling up to draw a rectangle at (x,y)
          int x = i*videoScale;
          int y = j*videoScale;
        
          
          if(int(random(0,10)) == 0 ){    
          fill(#0FF51C);
          stroke(255);
          ellipse(x+videoScale/2,y+videoScale/2 +40,current,current);
          }
          fill(#F50F2E);
          stroke(255);
          ellipse(0+videoScale/2 ,0+videoScale/2+40,current,current);
          
          fill(#210FF5);
          stroke(255);
          ellipse(width-videoScale/2,height-videoScale/2,current,current);
             
        }
      }
    }
    void text() {
          textFont(f,16); 
          text("Test",  100,100);
    }  
    
    
    

