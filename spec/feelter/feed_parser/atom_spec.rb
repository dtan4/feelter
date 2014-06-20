require "spec_helper"

module Feelter
  module FeedParser
    describe Atom do
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

          it { expect(parsable).to be true }
        end

        context "RSS is given" do
          let(:xml) do
            rss
          end

          it { expect(parsable).to be false }
        end
      end
    end
  end
end
