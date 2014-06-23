require "spec_helper"

module Feelter
  module Parser
    describe RSS do
      let(:atom) do
        open(fixture_path("atom.xml")).read
      end

      let(:rss) do
        open(fixture_path("rss.xml")).read
      end

      describe "#parsable?" do
        let(:parsable) do
          described_class.parsable?(xml)
        end

        context "Atom is given" do
          let(:xml) do
            atom
          end

          it { expect(parsable).to be false }
        end

        context "RSS is given" do
          let(:xml) do
            rss
          end

          it { expect(parsable).to be true }
        end
      end

      let(:instance) do
        described_class.new(rss)
      end

      describe "#initialize" do
        it "should have a instance of Nokogiri::XML::Document" do
          expect(instance.instance_variable_get(:@doc)).to be_a Nokogiri::XML::Document
        end
      end
    end
  end
end
