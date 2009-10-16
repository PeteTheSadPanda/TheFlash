#
# rb_main.rb
# TheFlash
#
# Created by Piotr Biegaj on 10/15/09.
# Copyright Engine Yard Inc. 2009. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
$LOAD_PATH << '/Users/pbiegaj/projects/TheFlash/Vendor/RSpec/lib/'
require 'spec/autorun'

framework 'Cocoa'

# Loading all the Ruby project files.
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.entries(dir_path).each do |path|
  if path != File.basename(__FILE__) and path[-3..-1] == '.rb'
    require(path)
  end
end

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)
