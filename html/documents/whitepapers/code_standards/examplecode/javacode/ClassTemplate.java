/**
 * @title "Template Java Code Package"
 * @description "A template for regular classes in Java."
 * @author  Joseph R. Kiniry
 * @copyright "(c) 1996-1998 California Institute of Technology.%
 *             %All Rights Reserved."
 * @license "Public Domain."
 * @version "$Id: ClassTemplate.java 1957 2001-08-06 06:33:53Z kiniry $"
 */

package examplecode.javacode;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Vector;

/**
 * <p> A class representing the archetypical class from which one can
 * learn code standards through example.  Provided above are some of
 * the more common classes used in imports.  Note their order. </p>
 *
 * Usage example:
 * &lt;pre&gt;
 * &lt;code&gt;
 * 	ClassTemplate classTemplate = new ClassTemplate();
 *	classTemplate.toString();
 * &lt;/code&gt;
 * &lt;/pre&gt;
 *
 * @see     AbstractClassTemplate
 * @see     ClassTemplate
 * @see     CodeTests
 * @see     ExceptionTemplate
 * @see     InterfaceTemplate
 * @see     java.lang.Object
 * @see     java.lang.Class#toString()
 * @version 1.2 $Date: 2001-08-06 07:33:53 +0100 (Mon, 06 Aug 2001) $
 * @author  Joseph R. Kiniry
 * @author  Daniel M. Zimmerman
 **/

public class ClassTemplate extends Object
  implements InterfaceTemplate
{
  // Attributes

  /**
   * <p> An instance field. </p>
   */

  public int anInstanceField = 31; // 31 is an interesting number

  // Constructors

  /**
   * <p> Builds a new ClassTemplate. </p>
   */

  public ClassTemplate() 
  {
    super();
  }

  // Public Methods

  /**
   * @return a printable string representation of this ClassTemplate.
   */

  public String toString()
  {
    return "ClassTemplate: " + this;
  }

  /**
   * <p> Prints (to standard out) the specified value, doubled. </p>
   *
   * @param value the value to be doubled and printed.
   */
  
  public void doubler(int value)
  {
    Integer toPrint = new Integer(value * 2);
    System.out.println(toPrint);
  }

  // Protected Methods


  /**
   * <p> Cleans up the class and its dependencies when it is garbage
   * collected. </p>
   *
   * @exception Throwable is the exception thrown by the finalizer.
   */

  protected void finalize() throws Throwable
  {
    // empty
  }

  // Package Methods
  // Private Methods

} // end of class ClassTemplate
