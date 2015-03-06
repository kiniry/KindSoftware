#!/usr/bin/python

import os, os.path, sys

#Copying between files
def copyToFileNoNewLines( file1, file2 ):
  # Copy contents with no line-breaks
  for line in file1.read().split( '\n' ):
    file2.write( line )

def copyToFile( file1, file2 ):
  # Copy contents, keeping line-breaks (including one for the last line)
  for line in file1:
    file2.write( line )

if ( len(sys.argv) != 2 ):
  print "Must provide path to root of menus."
  sys.exit( 1 )

menuRootPath = sys.argv[1] #Root for all menus

#Files
menuItemsListFile = 'list.txt' #File listing top-level choices
topFileName = 'top.xml' #Top-level entry file
subFileName = 'sub.xml' #Sub-menu entries file
outputFileName = 'selected.xml' #File-name to create

#Some strings
generatedWarning = '<!-- Automatically generated menu content. Do not edit. -->\n'
selectedItemStart = '<li id="subnavon">'
selectedItemEnd = '</li>'
unselectedItemStart = '<li>'
unselectedItemEnd = '</li>'
menuStart = '<div id="subnav">\n<ul>\n'
menuEnd = '</ul>\n</div>'

if ( not os.path.isdir( menuRootPath ) ):
  print "Path to root of menus is not valid - " + menuRootPath
  sys.exit( 1 )

for menuName in os.listdir( menuRootPath ):
  menuPath = menuRootPath + '/' + menuName
  if ( (not os.path.isdir( menuPath )) or menuName.startswith( '.' ) ):
    print "Skipping file " + menuPath + '\n'
    continue
  else:
    print "***Menu: " + menuName
  listFilePath = menuPath + '/' + menuItemsListFile
  if os.path.isfile( listFilePath ):
    #Open the list file and read the lines
    listFile = open( listFilePath, 'r' )
    listFileLines = listFile.readlines()

    for line in listFileLines:
      fileName = line.strip()
      filePath = menuPath + "/" + fileName
      #Check it's a valid directory
      if os.path.isdir( filePath ):
        print filePath
        outputFilePath = filePath + "/" + outputFileName
        if os.path.isfile( outputFilePath ):
          print "Removing existing " + outputFilePath
          os.remove( outputFilePath ) 
        print "Generating " + outputFilePath

        #Create our file for writing to
        outputFile = open( outputFilePath, 'w' )
        outputFile.write( generatedWarning )
        outputFile.write( menuStart )
        for line2 in listFileLines:
          fileName2 = line2.strip()
          file2Path = menuPath + "/" + fileName2
          topFilePath = file2Path + "/" + topFileName
          if ( os.path.isfile( topFilePath ) ):
            outputFile.write( '<!-- ' + fileName2 + ' -->\n' )
            topFile = open( file2Path + "/" + topFileName, 'r' )
            #Check if we are visiting the selected item
            if ( fileName == fileName2 ):
              #Write selected item parts
              outputFile.write( selectedItemStart )
              copyToFileNoNewLines( topFile, outputFile )
              subFilePath = file2Path + "/" + subFileName
              if ( os.path.isfile( subFilePath ) ):
                outputFile.write( '\n' )
                subFile = open( subFilePath, 'r' )
                copyToFile( subFile, outputFile )
                subFile.close()
              outputFile.write( selectedItemEnd )
            else:
              #Write unselected item parts
              outputFile.write( unselectedItemStart )
              copyToFileNoNewLines( topFile, outputFile )
              outputFile.write( unselectedItemEnd )
            topFile.close()
          outputFile.write( '\n' )
        outputFile.write( menuEnd )
        #outputFile.write( '\n' )
        outputFile.close()
    print '\n'
  else:
    print "Cannot find " + listFilePath + ". Aborting.\n"

