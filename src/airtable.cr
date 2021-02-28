require "json"

# TODO: Write documentation for `Airtable`
module Airtable
  VERSION = "0.1.0"

  abstract class Requester
    abstract def get(endpoint : String) : String
  end

  class HTTPRequester < Requester
    def initialize
    end

    def get(endpoint : String) : String
      return %({ "records": ["monkey"] })
    end
  end

  class Base
    @api_key : String
    @base_id : String
    @requester : Requester

    def initialize(@api_key : String, @base_id : String, @requester : Requester)
    end

    def initialize(@api_key : String, @base_id : String)
      @requester = HTTPRequester.new
    end

    def in(table_name : String) : Table
      Table.new @requester, table_name
    end
  end

  class Table
    @requester : Requester
    getter name : String

    def initialize(@requester : Requester, @name : String)
    end

    def all : JSON::Any
      json = @requester.get "URL"
      return JSON.parse json
    end
  end
end
