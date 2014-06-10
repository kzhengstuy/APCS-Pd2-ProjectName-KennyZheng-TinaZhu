import javax.swing.JFrame; //imports JFrame library
import javax.swing.JButton; //imports JButton library
import java.awt.GridLayout; //imports GridLayout library
import javax.swing.*;
import java.awt.*;
 
public class Grid {
 
        JFrame frame=new JFrame(); //creates frame
        JButton[][] grid; //names the grid of buttons
 
        public Grid(int width, int length){ //constructor
	    frame.setLayout(new GridLayout(width,length)); //set layout
	    grid=new JButton[length][width]; //allocate the size of grid
	    JButton.setPreferredSize(new Dimension(100,100));
	    for(int y=0; y<length; y++){
		for(int x=0; x<width; x++){
		    grid[x][y]=new JButton(""); //creates new button     
                                frame.add(grid[x][y]); //adds button to grid
		}
	    }
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    frame.pack(); //sets appropriate size for frame
	    frame.setVisible(true); //makes frame visible
        }
    public static void main(String[] args) {
	new Grid(20,20);//makes new Grid with 2 parameters
    }
}
