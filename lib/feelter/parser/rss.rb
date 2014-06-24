module Feelter
  module Parser
    class RSS
      def self.parsable?(xml)
        !((/\<rss|\<rdf/ =~ xml) && !(/feedburner/ =~ xml)).nil?
      end

      def initialize(xml)
        @doc = Nokogiri::XML.parse(xml)
      end

      def exclude_by(query)
        raise ArgumentError if query.nil?
        query.each { |key, value| filter_xml(key, value) }
        @doc.to_s
      end

      private

      def filter_xml(key, value)
        items.each do |item|
          next unless item.css(key.to_s)
          item.remove if /#{value}/ =~ item.css(key.to_s).text
        end
      end

      def items
        @doc.css("item")
      end
    end
  end
end
