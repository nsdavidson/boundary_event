require "boundary_event/version"

require "base64"
require "json"
require "net/http"
require "net/https"
require "uri"

class BoundaryEvent
	attr_accessor :api_key, :org_id
	
	def initialize(params = {})
		@api_key = params.fetch(:api_key, nil)
		@org_id = params.fetch(:org_id, nil)
	end
end
