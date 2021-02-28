require "./spec_helper"

class DummyRequester < Airtable::Requester
  def initialize
  end

  def get(endpoint : String) : String
    return %({ "records": ["monkey"] })
  end
end

describe Airtable do
  it "initializes Base without error" do
    base = Airtable::Base.new "api_key", "base_id"
  end

  it "returns a Table" do
    base = Airtable::Base.new "api_key", "base_id"
    table = base.in "table"
    table.name.should eq "table"
  end

  it "returns expected record in a Table" do
    requester = DummyRequester.new
    base = Airtable::Base.new "api_key", "base_id", requester
    table = base.in "monkies"
    records = table.all["records"]
    records[0].should eq "monkey"
  end
end
