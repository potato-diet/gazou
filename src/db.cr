require "granite/adapter/sqlite"

module Gazou
  Granite::Connections << Granite::Adapter::Sqlite.new(
    name: "sqlite", url: "sqlite3:./db.sqlite"
  )
end
