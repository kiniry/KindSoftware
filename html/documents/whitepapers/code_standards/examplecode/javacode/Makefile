#
# Template Java Code Package
#
# Copyright (c) 1996,1997 California Institute of Technology.
# All Rights Reserved.
#
# $Id: Makefile 1983 2001-12-03 00:07:19Z kiniry $
#
# package examplecode.javacode

MAKE =		make
BASEDIR =	../..
SUBDIRS =	
DOCDIR =	$(BASEDIR)/javadoc/
JDKSOURCEDIR =	/usr/local/java/src/
JDKCLASSDIR =	/usr/local/java/lib/classes.zip
CLASSPATH =	$(BASEDIR):$(JDKCLASSDIR):.
SOURCEDIR =	$(BASEDIR):$(JDKSOURCEDIR):.
JAVAPACKAGES =	\
	java.applet \
	java.awt \
	java.awt.image \
	java.awt.peer \
	java.io \
	java.lang \
	java.net \
	java.util
PACKAGE =	examplecode.javacode
ALLPACKAGES =	$(JAVAPACKAGES) $(INFOPACKAGES)
JAVAFILES =	\
	AbstractClassTemplate.java \
	ClassTemplate.java \
	CodeTests.java \
	ExceptionTemplate.java \
	InterfaceTemplate.java \
	JavadocClass.java
CLASSFILES =	\
	AbstractClassTemplate.class \
	ClassTemplate.class \
	CodeTests.class \
	ExceptionTemplate.class \
	InterfaceTemplate.class \
	JavadocClass.class
copyright = "Code Standard Examples<br />&copy; 1997-2001 Joseph Kiniry<br />&copy; 2000-2001 KindSoftware, LLC<br />All Rights Reserved"

%.class: %.java
	javac -g -deprecated -classpath "$(CLASSPATH)" $<

all: classes docs infogroup

docs: javadoc

classes: $(CLASSFILES)

subdirs:
	for i in $(SUBDIRS); \
	do (cd $$i; $(MAKE) classes;) \
	done

clean:
	rm -f $(CLASSFILES) *.class *~; \
	for i in $(SUBDIRS); \
	do (cd $$i; $(MAKE) clean;) \
	done

javadoc:
	javadoc -version -author -protected \
		-d $(DOCDIR) \
		-sourcepath $(SOURCEDIR) \
		-classpath $(CLASSPATH) \
		-doctitle "Example Java Code for KindSoftware Code Standard" \
		-header $(copyright) \
		-footer $(copyright) \
		$(PACKAGE)

infogroup:
	chgrp -R info *
	find . -type d -exec chmod 775 {} \;
	find . -type f -exec chmod 664 {} \;
	chmod -R a+rX *
