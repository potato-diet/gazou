module Gazou
  class Image < Granite::Base
    connection sqlite

    column rowid : Int64, primary: true
    column filename : String
    column checksum : String
    column created_at : Time?
  end
end
