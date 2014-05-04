require "spec_helper"
require "rack/test"

module Feelter
  describe App do
    include Rack::Test::Methods

    let(:app) { Feelter::App }

    describe "GET /" do
      it "should return 200" do
        get "/"
        expect(last_response).to be_ok
      end
    end
  end
end
