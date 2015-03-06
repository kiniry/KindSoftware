/**
 * @title "Template Java Code Package"
 * @description "A template for a unit test class in Java."
 * @author  Joseph R. Kiniry
 * @copyright "(c) 1996-1998 California Institute of Technology.%
 *             %All Rights Reserved."
 * @license "Public Domain."
 * @version "$Id: CodeTests.java 1957 2001-08-06 06:33:53Z kiniry $"
 */

package examplecode.javacode;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Hashtable;
import java.util.Vector;

/**
 * <p> A class representing the archetypical class from which one can
 * learn code standards through example.  Provided above are some of
 * the more common classes used in imports.  Note their order. </p>
 *
 * @see     AbstractClassTemplate
 * @see     ClassTemplate
 * @see     CodeTests
 * @see     ExceptionTemplate
 * @see     InterfaceTemplate
 * @version 1.2 $Date: 2001-08-06 07:33:53 +0100 (Mon, 06 Aug 2001) $
 * @author  Joseph R. Kiniry
 * @author  Daniel M. Zimmerman
 */

public abstract class CodeTests extends Object
  implements InterfaceTemplate
{
  // Attributes

  /**
   * <p> The meaning of classTemplate is the following... </p>
   */

  static volatile ClassTemplate classTemplate = 
    new ClassTemplate();

  // Statics

  /**
   * <p> A static initializer block. </p>
   */
  
  static
  {
    String unused = classTemplate.toString();
  }

  // Constructors
  // Public Methods

  /**
   * <p> The meaning of anInstanceField is the following... </p>
   */
  
  public transient int anInstanceField = 0;

  /**
   * <p> This is an instance field with a very, very long name. </p>
   */

  public String
    thisIsAnIntentionallyReallyReallyLongVariableNameThatIsInitialized =
    "Hi There!";
  
  /**
   * <p> This main method contains examples of every Java construct that
   * requires indention so that we can test our emacs modes. </p>
   *
   * @param arguments The arguments passed to the main program.
   */
  
  static public void main(String[] arguments)
  {
    String string = null;
    int loop = 0;
    String[] numbers = { "Zero", "One", "Two", "Three", "Four", "Five",
                         "Six", "Seven", "Eight", "Nine", "Ten", "Eleven",
                         "Twelve", "Thir", "Four", "Fif" };
    PrintStream out = System.out;
    
    for(loop = 0; loop < 29; loop++)
    {
      if(loop <= 12)
      {
	out.println(numbers[loop]);
      }
      /*
       * Some inline standard C comments.
       * Note the formatting.
       */
      else
	switch (loop)
        {
          case 13:
	  case 14:
	  case 15:
            {
              out.println(numbers[loop] + "teen");
              break;
            }
	  case 16:
	  case 17:
	  case 18:
	  case 19:
	    {
              out.println(numbers[loop - 10] + "teen");
              break;
            }
	  case 20:
	    {
              out.println("Twenty");
              break;
            }
	  default:
	    {
              out.println("Twenty-" + numbers[loop - 20]);
            }
	}
    }
    
    do
    {
      loop++;
    } while (loop < 20);
    
    while (loop > 0)
    {
      --loop;
    }
    
    int i = 0, j = 0;
    
    label: for(i = 0, j = 10; i < j; i++, j--)
    {
      out.println("k = " + i * j);
      if (i == 3)
	break label;
      else 
	continue label;
    }
    
    try
    {
      FileInputStream fileInputStream = new FileInputStream("foobar");
    }
    catch (IOException ioException)
    {
      System.err.println("Cannot open file `foobar'.");
    }
    finally
    {
      System.err.println("Done with loop and File statement.");
      System.err.println("Values are " + i + "," + j);
    }
  }

  /**
   * @return a string that represents this ClassTemplate.
   */
  
  public String toString()
  {
    return new Integer(anInstanceVariable).toString();
  }

  /**
   * <p> A method with an extremely long name. </p>
   *
   * @param param1 Placeholder parameter one.
   * @param param2 Placeholder parameter two.
   * @return a placeholder integer.
   */

  public int 
    AReallyLongMethodNameJustLikeTheVariableNameThatWeHadAbove(int param1,
                                                               int param2)
  {
    // stuff
  }

  // Protected Methods

  /**
   * <p> Clean up when garbage collecting. </p>
   *
   * @exception Throwable is the exception thrown by the finalizer.
   */
  
  protected void finalize() throws Throwable
  {
    // empty
  }

  /**
   * <p> An abstract protected method. </p>
   */
  
  abstract protected void aProtectedMethod();

  // Package Methods

  /**
   * <p> A method of some kind. </p>
   *
   * @concurrency GUARDED
   */
  
  synchronized void method()
  {
    final int foo = 0;
    double bar = 0.0;
    
    for(;;) {
      // empty
    }
  }

  // Private Methods
  
} // end of class CodeTests
