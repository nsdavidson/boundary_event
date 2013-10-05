require "boundary_event/version"

class BoundaryEvent
	# Attributes to hold credential data
	attr_accessor :api_key, :org_id

	# Attributes to hold event data
	attr_accessor :title, :tags, :status, :severity, :message, :properties, :source, :sender, :fingerprint_fields
	
	def initialize(params = {})
		@api_key = params.fetch(:api_key, nil)
		@org_id = params.fetch(:org_id, nil)
		populate_event(params)
	end

	def populate_event(params = {})
		@title = params.fetch(:title, nil) unless !params.has_key?(:title)
		@tags = params.fetch(:tags, nil)
		@status = params.fetch(:status, nil)
	end
end
