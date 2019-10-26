// Java Coding Reference.java

/*
Sun Microsystems released the Java programming language in 1995. Java is known for being simple, portable, secure, and robust.
Though it was released over twenty years ago, Java remains one of the most popular programming languages today.

One reason people love Java is the Java Virtual Machine, which ensures the same Java code can be run on different operating systems and platforms.
Sun Microsystems’ slogan for Java was “write once, run everywhere”.

Java is very similar to C and C++ syntactically.
*/

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Printing
{
  public static void main(String[] args)
  {
    System.out.println("Hello World!");
    call_func();
  }

  public static void call_func()
	{
		System.out.println("Printing another line.");
	}
}

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

public class Store
{
  // instance fields
  String productType;
  int inventoryCount;
  double inventoryPrice;
  
  /* Constructor method */
  public Store(String product, int count, double price)
  {
    productType = product;
    inventoryCount = count;
    inventoryPrice = price;
  }
  
  /* Main method */
  public static void main(String[] args)
  {
    Store lemonadeStand = new Store("lemonade", 42, .99);
    Store cookieShop = new Store("cookies", 12, 3.75);
    
    System.out.println("Our first shop sells " + lemonadeStand.productType + " at " + lemonadeStand.inventoryPrice + " per unit.");
    
    System.out.println("Our second shop has " + cookieShop.inventoryCount + " units remaining.");
  }
}

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

String
  // the '+' operator works for variable types that are not explicit strings
	.equals(<string_name>) // returns a boolean that tells whether the two strings are equal or not
Array

boolean

char
byte
int
short
long

float
double

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

true
false
null

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

+
-
*
/
%
=

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

>
<
>=
<=
==
!=

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

&&
||

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––


