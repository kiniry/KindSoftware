/**
 * @title "Template Java Code Package"
 * @description "A template for exceptions in Java."
 * @author  Joseph R. Kiniry
 * @copyright "(c) 1996-1998 California Institute of Technology. %
 *             %All Rights Reserved."
 * @license "Public Domain."
 * @version "$Id: ExceptionTemplate.java 1957 2001-08-06 06:33:53Z kiniry $"
 */

package examplecode.javacode;

/**
 * <p> A class representing the archetypical exception class from which
 * one can copy to build new exceptions. </p>
 *
 * @see     AbstractClassTemplate
 * @see     ClassTemplate
 * @see     CodeTests
 * @see     ExceptionTemplate
 * @see     InterfaceTemplate
 * @see     java.lang.Exception
 * @version 1.2 $Date: 2001-08-06 07:33:53 +0100 (Mon, 06 Aug 2001) $
 * @author  Joseph R. Kiniry
 * @author  Daniel M. Zimmerman
 */

public class ExceptionTemplate extends Exception
{
  // Attributes

  /**
   * <p> A constant, indicating that an unknown error has occurred. </p>
   */

  public static final int UNKNOWN_ERROR = 0;

  /**
   * <p> An error number that will be printed, in addition to the message,
   * when this exception is thrown. </p>
   */

  long errorNumber = UNKNOWN_ERROR;

} // end of class ExceptionTemplate

