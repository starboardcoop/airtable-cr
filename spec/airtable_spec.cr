require "./spec_helper"
require "./dummies/requester"
require "./spies/base"

describe Airtable do
  it "initializes Base without error" do
    base = Airtable::Base.new "api_key", "base_id"
  end

  it "initializes Base with api_key" do
    base = SpyBase.new "cheese", "base_id"
    base.api_key.should eq "cheese"
  end

  it "initializes Base with base_id" do
    base = SpyBase.new "api_key", "crackers"
    base.id.should eq "crackers"
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
