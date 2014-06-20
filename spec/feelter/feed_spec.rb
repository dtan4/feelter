require "spec_helper"
require "webmock/rspec"

module Feelter
  describe Feed do
    let(:feed) do
      described_class.new
    end

    describe "#parse_feed" do
      context "Atom is given" do
        let(:feed_url) do
          "http://example.com/atom.xml"
        end

        let(:xml) do
          open(fixture_path("atom.xml")).read
        end

        before do
          stub_request(:get, feed_url).to_return(body: xml, status: 200)
        end

        it "should get feed xml" do
          feed.parse_feed(feed_url)
          expect(feed.instance_variable_get(:@source)).to be_a Feelter::FeedParser::Atom
        end
      end

      context "RSS is given" do
        let(:feed_url) do
          "http://example.com/rss.xml"
        end

        let(:xml) do
          open(fixture_path("rss.xml")).read
        end

        before do
          stub_request(:get, feed_url).to_return(body: xml, status: 200)
        end

        it "should get feed xml" do
          feed.parse_feed(feed_url)
          expect(feed.instance_variable_get(:@source)).to be_a Feelter::FeedParser::RSS
        end
      end
    end
  end
end
