Copyright (c) 2007, Fintan Fairmichael, University College Dublin
All rights reserved.

This file is the readme that accompanies the bonc tool.

Contents:

  1. Description
  2. Requirements
  3. Using the tool
     3.1 Commandline Options
  4. Source
  5. Bug Reports


1. DESCRIPTION
==============

  Bonc is a parser and typechecker for the Business Object Notation (BON).
  
  This tool reads one or more files and/or input from standard input in the BON
  textual format, parses all this input and typechecks it. A number of options
  are available to modify the typechecking that is performed. Pretty-printing
  input is also available, with (x)html output planned for a future release.

  More information can be found on BON at the website 
  https://www.bon-method.com/, and by reading the book "Seamless object-oriented
  software architecture: analysis and design of reliable systems" which is 
  freely available on the site since it is out of print.


2. REQUIREMENTS
===============

  Since this tool has been written in Java, the only real requirements are a
  system that has a Java Runtime Environment (JRE) capable of running Java
  version 5 bytecode. The tool has been developed and tested primarily using
  Sun's official releases of Java, version 1.5/5.0 and 1.6/6.0. Whilst it might
  work with some of the alternative JRE implementations that support Java 5
  code, it has not been tested on these at all.

  The tool utilises the ANTLR parser generator, and releases of the tool
  include the appropriate ANTLR runtime as well as the StringTemplate library.
  ANTLR and StringTemplate are Copyright (c) 2003-2007, Terence Parr, under the
  BSD licence.

3. USING THE TOOL
===================

  Note that in this section we assume that you have successfully completed an 
  installation procedure as described in INSTALLATION.txt. We will use the tool
  as if it is on the path (i.e. simply "bonc"), but you can substitute for 
  ./bonc, /path/to/bonc, or similar, if necessary.

  Firstly, to see the available options type:
    bonc --help

  Standard usage is:
    bonc [options] file1 [file2 ...]

  For example:
    bonc file1

  The tool will then parse and typecheck the input, and report any errors. If
  the tool does not output any messages, then no errors were found.

  You can read from standard input by adding the option "-" (single-dash). This
  can be given as a file, or an option. For example, the following three
  commands will all produce the same result:
    bonc - file1 file2
    bonc file1 - file2
    bonc file1 file2 -
    
3.1 Commandline Options
-----------------------

  The tool recognises the following options:

  -                         Read from standard input.
  -d, --debug               Print debugging output.
  -f, -formal, --formal     Only check formal charts.
  -h, --help                Print this help message
  -i, -informal, --informal Only check informal charts.
  -nc, --no-consistency     Do not check consistency between levels.
  -ntc, --no-typecheck      Do not typecheck the input.
  -p, -print, --print=TYPE  Print the parsed input in the given format
                            (currently just TXT for plain-text).
  -po, --print-output=FILE  Print output to the given file instead of to
                            stdout.
  -pp, --pretty-print       Pretty-print the parsed input. This is equivalent
                            to -p=TXT.
  -t, -time, --time         Print timing information.


4. SOURCE
=========

  All source for this tool is available from the subversion repository. The
  repository is located at: 
    https://mobius.ucd.ie/repos/src/bon/bonc

  You can browse the source in your web browser:
    https://mobius.ucd.ie/browser/src/bon

   For more information on how to download and build this software, please read
   INSTALLATION.txt.


5. BUG REPORTS
==============

  Bug tracking is handled on the Mobius Trac (https://mobius.ucd.ie/). 

  To create a new ticket either complete the form at:
    https://mobius.ucd.ie/newticket?owner=fintan&component=BON
  or send an email to:
    bon-ticket@mobius.ucd.ie

  Please include the following details (where possible):
  - The commandline arguments with which you invoked the tool 
    (e.g. "bonc -i test.bon").
  - The operating system and java version you are using.
  - Any input files used to recreate the bug.  
  - The output generated when you detected the bug.

  Filing bugs will help to improve this software, so if you notice something
  amiss please do report it!
