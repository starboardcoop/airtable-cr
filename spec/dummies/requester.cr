require "../spec_helper"

class DummyRequester < Airtable::Requester
  def initialize
  end

  def get(endpoint : String) : String
    return %({ "records": ["monkey"] })
  end
end