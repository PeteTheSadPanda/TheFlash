#
#  SpecRunner.rb
#  TheFlash
#
#  Created by Piotr Biegaj on 10/15/09.
#  Copyright (c) 2009 Engine Yard Inc.. All rights reserved.
#/Users/pbiegaj/projects/TheFlash/spec/

class SpecRunner
	def initialize
		@default_options = ['--format', 'h/tmp/piotr_spec_output.html']
	end
	
	def runFile(file)
		options = @default_options
		options << file
		runner_options = Spec::Runner::OptionParser.parse(options, STDERR, STDOUT)
		puts "running w/options: #{runner_options.inspect}"
		Spec::Runner::CommandLine.run(runner_options)
	end
	
	def runFiles(files)
		options = @default_options
		options << files.split(',')
		runner_options = Spec::Runner::OptionParser.parse(options, STDERR, STDOUT)
		puts "running many files"
		Spec::Runner::CommandLine.run(runner_options)
	end
end
