require "./spec_helper"

describe Airtable do
  it "initializes Base without error" do
    base = Airtable::Base.new "api_key", "base_id"
  end
end
