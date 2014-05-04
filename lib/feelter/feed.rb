require "feelter"
require "open-uri"
require "rss"

module Feelter
  class Feed
    def initialize
      @source = nil
    end

    def get_feed(url)
      @source = RSS::Parser.parse(open(url).read, true)
    end
  end
end
