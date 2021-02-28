# TODO: Write documentation for `Airtable`
module Airtable
  VERSION = "0.1.0"

  class Base
    def initialize(api_key : String, base_id : String)
    end

    def in(table_name : String) : Table
      Table.new table_name
    end
  end

  class Table
    getter name : String

    def initialize(@name : String)
    end
  end
end
