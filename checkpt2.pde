
  // Size of each cell in the grid, ratio of window size to video size
  // 80 * 12 = 960
  // 60 * 12 = 720
  int videoScale = 80;
  //current is starting size of each circle
  int current = 20;
  int[][] nodes = new int[15][15]; //give amount on it
  int[][] colors = new int[15][15]; //give color of it
  // self/red are 1, neutral/green are 0, enemy/blue are -1
  // #F50F2E          #0FF51C                 #210FF5
  boolean clickAt; //whether its click 1 or click 2
  int clickedX;
  int clickedY;
  // Number of columns and rows in our system
  int cols, rows;
  boolean set;
  PFont f;
  
  void setup() {
    size(960,720);
    frameRate(.4);
    f = createFont("Book Antiqua",20,true);
    // Initialize columns and rows
    cols = width/videoScale;
    rows = height/videoScale;
    background(204,153,0 );
    set = false;
    clickAt = false;
    clickedX = -1;
    clickedY = -1;
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
            nodes[i][j] = current;
            colors[i][j] = 0;
          }else{
            nodes[i][j] = -1;
            colors[i][j] = -2;
          }
          fill(#F50F2E);
          stroke(255);
          ellipse(0+videoScale/2 ,0+videoScale/2,current,current);
          nodes[0][0] = current;
          colors[0][0] = 1;
          
          fill(#210FF5);
          stroke(255);
          ellipse(width-videoScale/2,height-videoScale/2,current,current);
          nodes[cols][rows] = current;
          colors[cols][rows] = -1;
          
          for (int a = 0; a <nodes.length;a++){
             for (int b = 0; b <nodes[0].length;b++){
                 if (nodes[a][b]==0){
                     nodes[a][b] = -1;
                     colors[a][b] = -2;
                 }
             }
          }
          set = true;
         
          displayText();
        }
          }
      }//ends the set-up of the board aka happens once per game
       //testPrint();

       grow(1);
       displayText();
       

      
    }
    
    
     void displayText() {
        textFont(f,25);
        textSize(10); 
        for (int a = 0; a < nodes.length; a++){
              for (int b = 0; b < nodes[0].length; b++){
                   if (nodes[a][b]!=-1){
                     fill(0, 102, 153, 204);
                     text(nodes[a][b],(a+.5)*videoScale,(b+.5)*videoScale);
                     
                   }
                   text(nodes[cols][rows],width-videoScale/2,height-videoScale/2);
              }
        }
      }
      
      void grow(int growth){
         for(int i = 0; i < cols; i++){
          
          for(int j = 0; j < rows; j++){
          
          int x = i*videoScale;
          int y = j*videoScale;
        if (colors[i][j] != -2){
          if(nodes[i][j]!=-1){   
            if (colors[i][j] == 1){
              fill(#F50F2E);
            }else if(colors[i][j] == 0){
              fill(#0FF51C);
            }else{
              fill(#210FF5);
            }
          }
            stroke(255);
            ellipse(x+videoScale/2,y+videoScale/2,nodes[i][j]+growth,nodes[i][j]+growth);
            nodes[i][j]+=growth;
          }
          
          }}
          fill(#210FF5);
          ellipse(width-videoScale/2,height-videoScale/2,nodes[cols][rows]+growth,nodes[cols][rows]+growth);
          nodes[cols][rows]+=growth;
      }
      
      void mouseMoved(){
          for (int a = 0; a < nodes.length; a++){
            for (int b = 0; b < nodes[0].length; b++){
              if (nodes[a][b]!=-1){
                if (mouseX>a*videoScale && mouseX<(a+1)*videoScale && mouseY>b*videoScale && mouseY<(b+1)*videoScale){
                  cursor(HAND);
                }else{
                  cursor(ARROW);
                }
                  
                }
              }
            }
          }
          
      void mouseClicked(){
        if (!clickAt){
          for (int a = 0; a < nodes.length; a++){
              for (int b = 0; b < nodes[0].length; b++){
                if (nodes[a][b]!=-1){
                  float x = (float)mouseX/videoScale;
                  float y = (float)mouseY/videoScale;
                  if (x > a*videoScale && x < (a+1)*videoScale && y > b*videoScale && y < (b+1)*videoScale){
                     clickedX = a*videoScale;
                     clickedY = b*videoScale;
                     clickAt = true;
                  }
              }
          }}
      }else{
        for (int a = 0; a < nodes.length; a++){
              for (int b = 0; b < nodes[0].length; b++){
                if (nodes[a][b]!=-1){
                  float x = (float)mouseX/videoScale;
                  float y = (float)mouseY/videoScale;
                  if (x > a*videoScale && x < (a+1)*videoScale && y > b*videoScale && y < (b+1)*videoScale){
                    nodes[a][b]+=nodes[clickedX][clickedY];
                    nodes[clickedX][clickedY] = nodes[clickedX][clickedY]/2;
                    clickAt = false;
                  }
                }
              }
        }
      }
      }
                    
      
          
      
      
     
      
      void testPrint(){
          String printString = "";
          for (int a = 0; a < nodes.length; a++){
              for (int b = 0; b < nodes[0].length; b++){
                  printString+=nodes[a][b]+",";
              }
          }
          print(printString);
          //print(nodes[0].length);
      }
    
    

