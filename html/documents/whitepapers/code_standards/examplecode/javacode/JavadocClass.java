/**
 * @title "Template Java Code Package"
 * @description "A template including all properties defined in the %
 *               %KindSoftware code standard."
 * @author  Joseph R. Kiniry
 * @copyright "(c) 1996-1998 California Institute of Technology. %
 *             %All Rights Reserved."
 * @license "Public Domain."
 * @version "$Id: JavadocClass.java 1957 2001-08-06 06:33:53Z kiniry $"
 */

package examplecode.javacode;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Vector;

/**
 * <p> This class provides a Javadoc comment block with all the tags we
 * have defined.  Also provided above are some of the more common
 * classes used in imports.  Note their order. </p>
 *
 * @version 1.2 $Date: 2001-08-06 07:33:53 +0100 (Mon, 06 Aug 2001) $
 * @author  Joseph R. Kiniry
 * @author  Daniel M. Zimmerman
 */

public class JavadocClass extends Object
{
  /**
   * <p> This is a large Javadoc comment block that contains every Javadoc
   * tag currently in use by us.  It is used for a tag reference and a
   * cut-and-paste source.  Parentheses around expressions are necessary.
   * Parentheses around choices (as in @concurrency) indicate a
   * mutually-exclusive and necessary choice must be made.  Brackets
   * indicate an optional choice. </p>
   *
   * Meta-Information:
   * @author Full Name
   * @history Description
   *
   * Versioning:
   * @version Version-String $Date: 2001-08-06 07:33:53 +0100 (Mon, 06 Aug 2001) $
   * @deprecated Reference to replacement API.
   * @since version-tag
   *
   * Design:
   * @design Description
   *
   * Pending Work:
   * @bug Description of the bug
   * @review Username - Description
   * @todo Username - Description
   *
   * Java Usage Information:
   * @param parameter-name [WHERE (Expression)] Description
   * @return Description
   * @exception ExceptionClassName [IF (Expression)] Description
   *
   * Preconditions:
   * @precondition/@pre (Expression) Description
   * @precondition/@pre (Expression) <MyPreException> - Description
   * @requires (Expression) Description
   *
   * Postconditions:
   * @postcondition/@post (Expression) Description
   * @postcondition/@post (Expression) <MyPostException> - Description
   * @ensures (Expression) Description
   * @generates (Expression) [Description]
   * @modifies (SINGLE-ASSIGNMENT | QUERY | Expression) Description
   *
   * Invariants:
   * @invariant (Expression) Description
   * @invariant (Expression) <MyInvariantException> Description
   *
   * Concurrency Control:
   * @concurrency (SEQUENTIAL | GUARDED | CONCURRENT) [Description]
   *
   * Inheritance:
   * @hides FullClassName.FieldName [Description]
   * @overrides FullClassName.MethodName() [Description]
   *
   * Documentation:
   * @equivalent (Expression | Code Reference)
   * @example Description
   * @see APIName Label
   * {@link APIName Label}
   *
   * Serialization:
   * @serial Description
   * @serialField Field-Name Field-Type Description
   * @serialData Description
   *
   * Dependencies:
   * @references (Expression) [Description]
   * @uses (Expression) [Description]
   *
   * Miscellaneous:
   * @guard (Expression) [Description]
   * @values (Expression) [Description]
   */
  
  // Constructors

  /**
   * <p> This is a default constructor. It does nothing of
   * consequence. </p>
   */

  public JavadocClass()
  {
    super();
  }

} // end of class JavadocClass
