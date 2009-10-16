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
	attr_accessor :error_field
	
	def runFile(sender)
		error_field.stringValue = ''
		progress_spinner.startAnimation(sender)
		begin
		  SpecRunner.new.runFile(testfile_field.stringValue)
		rescue RuntimeError => e
			puts "oops!! #{e.inspect}"
			progress_spinner.stopAnimation(sender)
			populateErrorMessage(sender, e)
			return
		end
		progress_spinner.stopAnimation(sender)
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
	
	def populateErrorMessage(sender, exception)
		error_field.stringValue = exception.message.split(':').first
	end
end
