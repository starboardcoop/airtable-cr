require "../spec_helper"

class SpyBase < Airtable::Base
  def api_key
    @api_key
  end

  def id
    @base_id
  end

  def requester
    @requester
  end
end