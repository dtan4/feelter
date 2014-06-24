module Feelter
  module Parser
    class Atom
      def self.parsable?(xml)
        !/\<feed[^\>]+xmlns\s?=\s?[\"|\'](http:\/\/www\.w3\.org\/2005\/Atom|http:\/\/purl\.org\/atom\/ns\#)[\"|\'][^\>]*\>/.match(xml).nil?
      end

      def initialize(xml)
        @doc = Nokogiri::XML.parse(xml)
      end

      def exclude_by(query)
        raise ArgumentError if query.nil?
        query.each { |key, value| filter_xml(key.to_s, value) }
        @doc.to_s
      end

      private

      def filter_xml(key, value)
        entries.each do |entry|
          next unless entry.css(key)
          entry.remove if /#{value}/ =~ entry.css(key).text
        end
      end

      def entries
        @doc.css("entry")
      end
    end
  end
end
