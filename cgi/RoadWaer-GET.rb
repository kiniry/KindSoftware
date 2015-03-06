#!/usr/bin/ruby

# our Google Maps static API key
# ABQIAAAA_IALsZPzR-ftYdXVPoH4TBQjwM5_ZgByvnilBpKytVT8e_YzIRQFzq_M_TEWsXakNjY_oofG54GZeQ

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
    "  <dt>markers\n" +
    "  <dd>" + $markers + "\n" +
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
  # time (ms since 1-1-1970), event type, magnitude, latitude, longitude
  #file.puts($time + "," + $event_type + "," + $magnitude + 
  #          "," + $latitude + "," + $longitude);
  file.puts($markers);
  $debugdata = $debugdata + "puts\n"
  # Make sure the output file is always closed.
  file.close
  $debugdata = $debugdata + "close\n"

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

# Get data as passed via the HTTP GET.
# We conform to the Google Maps static API which is of the form
#  center=X,Y
#  zoom=Z
#  size=XxY
#  maptype=TYPE
#  markers=[X,Y,label[,time,event_type,magnitude]|]+
#  key=KEY
#  sensor=[true|false]
#
# For example:
# http://maps.google.com/staticmap?center=40.714728,-73.998672&zoom=14&size=512x512&maptype=mobile&markers=40.702147,-74.015794,blues,12345,pothole,2.5%7C40.711614,-74.012318,greeng%7C40.718217,-73.998284,redc&key=MAPS_API_KEY&sensor=false

$markers = $cgi["markers"]
$time = $cgi["time"]
$event_type = $cgi["event_type"]
$magnitude = $cgi["magnitude"]
$latitude = $cgi["latitude"]
$longitude = $cgi["longitude"]

# append the data to the datafile
writeData

# append the trailer regardless and exit
trailer

# write the page
writePage

