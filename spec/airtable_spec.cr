require "./spec_helper"

describe Airtable do
  it "initializes Base without error" do
    base = Airtable::Base.new "api_key", "base_id"
  end

  it "returns a Table" do
    base = Airtable::Base.new "api_key", "base_id"
    table = base.in "table"
    table.name.should eq "table"
  end

  it "returns all records in a Table" do
    base = Airtable::Base.new "api_key", "base_id"
    table = base.in "monkies"
    records = table.all
    records.size.should eq 1
  end
end
