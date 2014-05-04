require "sinatra/base"
require "sinatra/reloader"
require "slim"

module Feelter
  class App < Sinatra::Base
    set :root, File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "app"))

    configure :development do
      register Sinatra::Reloader
    end

    get "/" do
      slim :index
    end
  end
end
