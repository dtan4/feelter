require "feedjira"
require "open-uri"

module Feelter
  class Feed
    def initialize
      @source = nil
    end

    def get_feed(url)
      @source = Feedjira::Feed.parse(open(url).read)
    end
  end
end
