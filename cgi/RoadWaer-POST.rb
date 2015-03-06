#!/usr/bin/ruby

require "cgi"
require "ftools"

# Are we debugging this script?

$debug = true
$debugdata = ""

$cgi = CGI.new("html4t")

# The datafile to which we write event data.

$datafilename = "data/RoadWaer.data"

# The character separator used in the datafile.

$sep = ":"

# Output page.  Default value is header.

$page = 
    '<!DOCTYPE html PUBLIC "-//w3c//dtd xhtml 1.0 transitional//en"' + "\n" +
    ' "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' + "\n" +
    '<html xmlns="http://www.w3.org/1999/xhtml">' + "\n" +
    "<head>\n" +
    '<meta http-equiv="Content-Type" ' +
      'content="text/html; charset=iso-8859-1"' + "/>\n"

# Output trailer of redirect.

def trailer
  $page = $page + "</head>\n" + 
    "<body>\n"
  if $debug 
    showData
    $page = $page + $debugdata
  end
  $page = $page + "</body>\n" +
    "</html>\n"
end

# Print all data as a table.

def showData
  $page = $page +
    "<dl>\n" +
    "  <dt>events\n" +
    "  <dd>" + $events + "\n" +
    "</dl>\n"
end

=begin
 Is the passed string non-nil and non-empty?
 : s
   the string to check
=end
def validString?(s)
  if s.nil? 
    false
  else if s.empty?
         false
       end
  end
  true
end

=begin
  Write the RoadWaer data to our datafile.
=end
def writeData
  # Make the directory to store the RoadWaer data.
  File.makedirs(File.dirname($datafilename))
  $debugdata = $debugdata + "makedir\n"

  # Open the file to append the registration data.
  file = File.open($datafilename, "a")
  $debugdata = $debugdata + "open\n"
  # Write user data.
  file.puts($events.read.print)
  $debugdata = $debugdata + "puts\n"
  # Make sure the output file is always closed.
  file.close
  $debugdata = $debugdata + "close\n"

  $debugdata = $debugdata + value.local_path + "\n"
  $debugdata = $debugdata + value.original_filename + "\n"
  $debugdata = $debugdata + value.content_type + "\n"
  true

  rescue
    false
end

# Print out the current page.
def writePage
  $cgi.out{$page}
end

######################################################################
# Main
######################################################################

# Get data as an IO object.  If there isn't much data, then it is an 
# IOString, otherwise it is a Tempfile.

$events = $cgi['data']

# append the data to the datafile
writeData

# append the trailer regardless and exit
trailer

# write the page
writePage

