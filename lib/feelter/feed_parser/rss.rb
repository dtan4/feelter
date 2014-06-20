require "nokogiri"

module Feelter
  module FeedParser
    class RSS
      def self.parsable?(xml)
        !((/\<rss|\<rdf/ =~ xml) && !(/feedburner/ =~ xml)).nil?
      end

      def initialize(xml)
        @doc = Nokogiri::XML.parse(xml)
      end
    end
  end
end
