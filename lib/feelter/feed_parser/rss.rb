module Feelter
  module FeedParser
    class RSS
      def self.parsable?(xml)
        !((/\<rss|\<rdf/ =~ xml) && !(/feedburner/ =~ xml)).nil?
      end
    end
  end
end
