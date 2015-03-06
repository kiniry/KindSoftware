#!/usr/bin/ruby

require "cgi"
require "ftools"

# Are we debugging this script?

$debug = false
$debugdata = ""
if $debug
  $delay = 10
else
  $delay = 1
end

$cgi = CGI.new("html4t")

# Redirect to successURL if all necessary information is provided and we
# successfully save it.  Redirect to moreinfoURL if all necessary 
# information isn't provided.  Redirect to failureURL if some other 
# failure takes place.

$successURL = "/products/opensource/KindFTP/success.html"
$moreinfoURL = "/products/opensource/KindFTP/moreinfo.html"
$failureURL = "/products/opensource/KindFTP/failure.html"

# The datafile to which we write registration information.

$datafilename = "data/KindFTP.data"

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

# Check to see if all module variables are valid.

def validData?
  validString?($name) & validString?($organization) & validString?($email) &
    validString?($source) & validString?($use) & validString?($notification) & 
    $email.include?("@") & $email.include?(".")
end

# Print all data as a table.

def showData
  $page = $page +
    "<dl>\n" +
    "  <dt>name\n" +
    "  <dd>" + $name + "\n" +
    "  <dt>organization\n" +
    "  <dd>" + $organization + "\n" +
    "  <dt>email\n" +
    "  <dd>" + $email + "\n" +
    "  <dt>source\n" +
    "  <dd>" + $source + "\n" +
    "  <dt>use\n" +
    "  <dd>" + $use + "\n" +
    "  <dt>notification\n" +
    "  <dd>" + $notification + "\n" +
    "</dl>\n"
end

# Redirect for more information.

def moreinfo
  $page = $page + '<meta http-equiv="Refresh" content="' + $delay.to_s + ';' +
    'URL=' + $moreinfoURL + '"' + "/>\n"
end

# Redirect for failure.

def failure
  $page = $page + '<meta http-equiv="Refresh" content="' + $delay.to_s + ';' +
    'URL=' + $failureURL + '"' + "/>\n"
end

# Redirect for success.

def success
  $page = $page + '<meta http-equiv="Refresh" content="' + $delay.to_s + ';' +
      'URL=' + $successURL + '"' + "/>\n"
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
  Write the registration information to "file".
=end
def writeInfo
  # Make the directory to store the registration data.
  File.makedirs(File.dirname($datafilename))
  $debugdata = $debugdata + "Makedirs\n"

  # Open the file to append the registration data.
  file = File.open($datafilename, "a")
  $debugdata = $debugdata + "Open\n"
  # Write user data.
  file.puts($name + $sep +
            $organization + $sep + 
            $email + $sep +
            $source + $sep + 
            $use + $sep +
            $notification)
  $debugdata = $debugdata + "puts\n"
  # Make sure the output file is always closed.
  file.close
  $debugdata = $debugdata + "file.close\n"
  true

  rescue
    false
end

# Print out the current page.
def writePage
  $cgi.out{$page}
end

# Main

# Get data
$name = $cgi['name']
$organization = $cgi['organization']
$email = $cgi['email']
$source = $cgi['source']
$use = $cgi['use']
$notification = $cgi['notification']

# Check the validity of the data.
if ! validData?
  $debugdata = $debugdata + "Data not valid!\n"
  moreinfo
  trailer
  writePage
  exit
end

# Try to write the registration data.
if writeInfo
  success
else
  $debugdata = $debugdata + "Couldn't write data!\n"
  failure
end

# Append the trailer regardless and exit.
trailer

# Write the page.
writePage

