module Helpers

	def self.media_path(file)
	  File.join(File.dirname(File.dirname(__FILE__)), 'voidwalker/media', file)
	end

end