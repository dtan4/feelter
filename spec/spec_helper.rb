require "coveralls"
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'feelter'

def fixture_path(name)
  File.expand_path(File.join("..", "fixtures", name), __FILE__)
end
