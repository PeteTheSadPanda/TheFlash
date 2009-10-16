#
#  TFTableDelegate.rb
#  TheFlash
#
#  Created by Piotr Biegaj on 10/15/09.
#  Copyright (c) 2009 Engine Yard Inc.. All rights reserved.
#

class TFTableDelegate
	attr_accessor :spec_lines

	def initialize
		self.spec_lines = []
	end

	def numberOfRowsInTableView(view)
		self.spec_lines.size
	end

	def tableView(view, objectValueForTableColumn:column, row:index)
		
	end
end
