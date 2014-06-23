require "nokogiri"

module Feelter
  module Parser
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
