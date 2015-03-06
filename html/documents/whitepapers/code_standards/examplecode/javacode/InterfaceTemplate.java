/**
 * @title "Template Java Code Package"
 * @description "A template for interfaces in Java."
 * @author  Joseph R. Kiniry
 * @copyright "(c) 1996-1998 California Institute of Technology. %
 *             %All Rights Reserved."
 * @license "Public Domain."
 * @version "$Id: InterfaceTemplate.java 1980 2001-12-03 00:01:41Z kiniry $"
 */

package examplecode.javacode;

/**
 * <p> A class representing the archetypical interface from which one can
 * copy to build new interfaces. </p>
 *
 * @see     AbstractClassTemplate
 * @see     ClassTemplate
 * @see     CodeTests
 * @see     ExceptionTemplate
 * @see     InterfaceTemplate
 * @see     java.lang.Object
 * @version 1.2 $Date: 2001-12-03 00:01:41 +0000 (Mon, 03 Dec 2001) $
 * @author  Joseph R. Kiniry
 * @author  Daniel M. Zimmerman
 */

public interface InterfaceTemplate
{
  // Attributes

  /**
   * <p> The version string for this interface. </p>
   */

  public final String versionString = "1.2";

  // Public Methods

  /**
   * <p> Some public method. </p>
   *
   * @concurrency GUARDED
   */
  
  public int aMethod(String foo);
  
} // end of interface InterfaceTemplate
