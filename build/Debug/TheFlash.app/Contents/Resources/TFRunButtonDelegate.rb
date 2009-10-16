#
#  TFRunButtonDelegate.rb
#  TheFlash
#
#  Created by Piotr Biegaj on 10/15/09.
#  Copyright (c) 2009 Engine Yard Inc.. All rights reserved.
#

class TFRunButtonDelegate
	attr_accessor :testfile_field
	attr_accessor :progress_spinner
	attr_accessor :browser
	
	def runFile(sender)
		self.progress_spinner.startAnimation(sender)
		SpecRunner.new.runFile(testfile_field.stringValue)
		self.progress_spinner.stopAnimation(sender)
		populateWindow
	end
	
	def populateWindow
		filename = '/tmp/piotr_spec_output.html'
		if File.exists?(filename)
  		url = NSURL.URLWithString(filename)
		  browser.mainFrame.loadHTMLString(File.open(filename).read, :baseURL => url)
		end
	end
	
	def clearWindow(sender)
		url = NSURL.URLWithString('')
		browser.mainFrame.loadHTMLString('', :baseURL => url)
	end
end
