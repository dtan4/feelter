require "open-uri"

module Feelter
  class Feed
    def initialize
      @source = nil
    end

    def get_feed(url)
      xml = open(url).read

      parser_classes.each do |klass|
        if klass.parsable?(xml)
          @source = klass.new(xml)
          break
        end
      end

      railse InvalidFeedExecption if @source.nil?
    end

    private

    def parser_classes
      [
       Feelter::FeedParser::Atom,
       Feelter::FeedParser::RSS,
      ]
    end
  end

  class InvalidFeedExecption < Exception; end
end
