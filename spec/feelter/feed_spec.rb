require "spec_helper"
require "webmock/rspec"

WebMock.allow_net_connect!

module Feelter
  describe Feed do
    let(:feed) { described_class.new }
    let(:feed_url) { "http://example.com/sample.xml" }
    let(:xml) { open(fixture_path("sample.xml")).read }

    describe "#get_feed" do
      before do
        stub_request(:get, feed_url).to_return(body: xml, status: 200)
      end

      it "should get feed xml" do
        feed.get_feed(feed_url)
        expect(feed.instance_variable_get(:@source).title).to eq "RubyFlow"
      end
    end
  end
end
