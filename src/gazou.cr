require "kemal"
require "./db"
require "./models/image"
require "./routes"

module Gazou
  Kemal.run
end
