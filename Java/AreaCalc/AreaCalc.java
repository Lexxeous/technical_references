import java.util.*;

public class AreaCalc {
  
	public static void main(String[] args) {
    
	  Scanner keyboard = new Scanner(System.in);
    
	  System.out.println("Shape Area Calculator:");
	
	  while(true) {
    
	    System.out.println();
	    System.out.println("-=-=-=-=-=-=-=-=-=-");
	    System.out.println();
	    System.out.println("1) Triangle");
	    System.out.println("2) Rectangle");
	    System.out.println("3) Circle");
	    System.out.println("4) Quit");
      System.out.println();
      
	    System.out.print("Which shape?: ");
	
      int shape = keyboard.nextInt();
	    System.out.println();
	
	    if (shape == 1) {
		    area_triangle(2,2);
	    } else if (shape == 2) {
		    area_rectangle(2,2);
	    } else if (shape == 3) {
	    	area_circle(2);
	    } else if (shape == 4) {
		    quit();
		    break;
	    }
	  }
  }
	
  public static double area_triangle(double base, double height) {
    
		Scanner keyboard = new Scanner(System.in);
    
		System.out.print("Base: ");
		base = keyboard.nextInt();
    
		System.out.print("Height: ");
		height = keyboard.nextInt();
    
		System.out.println();
    
		double area = (base * height) / 2;
		System.out.println("The area of a right triangle with a base of " + base + 
			" and a height of " + height + " is " + area + ".");
		
    return area;
	}
	
  public static double area_rectangle(double length, double width){
    
		Scanner keyboard = new Scanner(System.in);
    
		System.out.print("Length: ");
		length = keyboard.nextInt();
    
		System.out.print("Width: ");
		width = keyboard.nextInt();
    
		System.out.println();
    
		double area = length * width;
		System.out.println("The area of a rectangle with a base of " + width + 
			" and a width of " + width + " is " + area + ".");
    
		return area;
	}
  
  public static double area_circle(double radius) {
    
		Scanner keyboard = new Scanner(System.in);
    
		System.out.print("Radius: ");
		radius = keyboard.nextInt();
    
		System.out.println();
    
		double area = Math.PI * radius * radius;
		System.out.println("The area of a circle with a radius of " + radius + " is " + area + ".");
    
		return area;
	}
  
	public static String quit() {
		System.out.println("Goodbye!");
		return null; 
	}
}
