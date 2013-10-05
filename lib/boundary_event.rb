require "boundary_event/version"

class BoundaryEvent
	attr_accessor :api_key, :org_id
	
	def initialize(params = {})
		@api_key = params.fetch(:api_key, nil)
		@org_id = params.fetch(:org_id, nil)
	end
end
