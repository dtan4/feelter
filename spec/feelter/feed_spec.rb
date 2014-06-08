require "spec_helper"
require "webmock/rspec"

WebMock.allow_net_connect!

module Feelter
  describe Feed do
    let(:feed) do
      described_class.new
    end

    describe "#get_feed" do
      context "with RSS 2.0" do
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
          feed.get_feed(feed_url)
          expect(feed.instance_variable_get(:@source).title).to eq "Sample RSS"
        end
      end

      context "with Atom" do
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
          feed.get_feed(feed_url)
          expect(feed.instance_variable_get(:@source).title).to eq "Sample Atom"
        end
      end
    end
  end
end
