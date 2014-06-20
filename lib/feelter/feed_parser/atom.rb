module Feelter
  module FeedParser
    class Atom
      def self.parsable?(xml)
        !/\<feed[^\>]+xmlns\s?=\s?[\"|\'](http:\/\/www\.w3\.org\/2005\/Atom|http:\/\/purl\.org\/atom\/ns\#)[\"|\'][^\>]*\>/.match(xml).nil?
      end
    end
  end
end
