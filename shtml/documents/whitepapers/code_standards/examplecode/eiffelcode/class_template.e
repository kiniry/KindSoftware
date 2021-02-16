indexing
   -- Mandatory index clauses.
   title:       "Title of project of which this class is a part."
   description: "Description of this class."
   copyright:   "Copyright (C) 2002, Joseph R. Kiniry"
   license:     "Eiffel Forum License, version 1 (see forum.txt)"
   author:      "Joseph R. Kiniry <kiniry@acm.org>"
   revision:    "$Revision: 2101 $"
   version:     "The version identifier of this class."

   -- Others.
   date: 23, April, 2002

class CLASS_TEMPLATE
   -- Single-line summary of class. (equivalent to "bon" semantic property)

inherit
   PARENT_CLASS
      rename
         old_name as new_name, foo as bar
      export
         {CLIENT} c
      undefine
         names, we, dont, want
      redefine
         a, b, c
      select
         b
      end

   PARAMETERIZED [T]

   CONSTRAINED_PARAMETERIZED [U -> CLASSNAME]

   FOOBAR[like a_function]

creation
   make, another_make

feature {CLIENT, CLASS, LIST, ANY, NONE} -- Label

   anchored_feature: like Current

   another_one: like anchored_feature

   make is
         -- Documentation.
      require
         precondition_label: a_precondition
      do
         some_code
         some_more_code
         check
            an_assertion
         end
      ensure
         postcondition_label: a_postcondition
      end

   another_make (has: T; parameters: U) is
         -- The commend for this feature.
      do
      end

   frozen a_function: STRING is
         -- Docs
      do
         Result := "Test"
      end

   variable_attribute: INTEGER

   other_variable_attribute: SOME_CLASS

   constant_attribute: REAL is 3.56

   other_constant_attribute: INTEGER is unique

   procedure (argument1: INTEGER; argument2: SOME_CLASS) is
         -- Docs
      local
         local_variable: REAL
      do
      end

   deferred_feature is
         -- Docs
      deferred
      end

   function_with_arguments (argument1, argument2: SOME_CLASS): OTHER_CLASS is
         -- Docs
      do
         create Result
         Result.some_procedure (argument2)
      end

   function_without_arguments: INTEGER is
         -- Docs
      do
         from
            go_before
         invariant
            0 <= child_position; child_position <= arity + 1
         variant
            arity - child_position + 1
         until
            child_after or else (j = i)
         loop
            child_forth
            if (sought = child) then
               j := j + 1
            end
         end
         
         Result := some_value
      end

   infix "+" (some_matrix: like Current): like Current is
         -- Matrix sum of `Current' and `some_matrix'.
      do
         -- computation
      end

feature -- Initialization

feature -- Access

feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Comparison

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Output

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
   invariant_clause: True -- Your invariant here

end -- class CLASS_INTERFACE
