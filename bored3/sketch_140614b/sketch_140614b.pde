  // Example 16-6: Drawing a grid of squares
  
  // Size of each cell in the grid, ratio of window size to video size
  // 80 * 8 = 640
  // 60 * 8 = 480
  int videoScale = 80;
  //current is starting size of each circle
  int current = 50;
  String[][] nodes = new String[15][15];
  
  // Number of columns and rows in our system
  int cols, rows;
  boolean set;
  PFont f;
  
  void setup() {
    size(960,720);
    frameRate(1);
    f = createFont("Book Antiqua",20,true);
    // Initialize columns and rows
    cols = width/videoScale;
    rows = height/videoScale;
    background(204,153,0 );
    set = false;
    //noLoop();
  }
  
    void draw() {
      if (!set){
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
            ellipse(x+videoScale/2,y+videoScale/2,current,current);
            nodes[i][j] = "y"+current;
          }else{
            nodes[i][j] = "n"+current;
          }
          fill(#F50F2E);
          stroke(255);
          ellipse(0+videoScale/2 ,0+videoScale/2,current,current);
          nodes[0][0] = "y"+current;
          
          fill(#210FF5);
          stroke(255);
          ellipse(width-videoScale/2,height-videoScale/2,current,current);
          nodes[rows][cols] = "y"+current;
          
          set = true;
          text();
          testPrint();
          noLoop();
        }
          }
      }//ends the set-up of the board
    }
    
    
      void text() {
          textFont(f,16); 
          text("Test",  100,100);
      }
      
      void testPrint(){
          String printString = "";
          for (int a = 0; a < nodes.length; a++){
              for (int b = 0; b < nodes[0].length; b++){
                  printString+=nodes[a][b];
              }
          }
          noLoop();
          print(printString);
      }
