require "boundary_event/version"
require "base64"
require "uri"
require "net/http"
require "net/https"
require "json"

BOUNDARY_API_URL = "api.boundary.com"

class BoundaryEvent
	# Attributes to hold credential data
	attr_accessor :api_key, :org_id

	# Attributes to hold event data
	attr_accessor :event_data
	
	def initialize(params = {})
		@api_key = params.fetch(:api_key, nil)
		@org_id = params.fetch(:org_id, nil)
		populate_event(params)
	end

	def populate_event(params = {})
		@event_data = {
			:title => (params.fetch(:title, nil) unless !params.has_key?(:title)),
			:tags => (params.fetch(:tags, nil) unless !params.has_key?(:tags)),
			:status => (params.fetch(:status, nil) unless !params.has_key?(:status)),
			:severity => (params.fetch(:severity, nil) unless !params.has_key?(:severity)),
			:message => (params.fetch(:message, nil) unless !params.has_key?(:message)),
			:properties => (params.fetch(:properties, nil) unless !params.has_key?(:properties)),
			:source => (params.fetch(:source, nil) unless !params.has_key?(:source)),
			:sender => (params.fetch(:sender, nil) unless !params.has_key?(:sender)),
			:fingerprint_fields => (params.fetch(:fingerprint_fields, nil) unless !params.has_key?(:fingerprint_fields)),
		}
	end

	def send_event
		# Encode API key
		key = api_key_encode("#{@api_key}:")

		# Set headers for HTTP request
		headers = { 
			"Authorization" => "Basic #{key}", 
			"Content-Type" => "application/json"
		}

		uri = URI("https://#{BOUNDARY_API_URL}/#{org_id}/events")
		http_conn = Net::HTTP.new(uri.host, uri.port)
		http_conn.use_ssl = true

		begin
			timeout(10) do 
				request = Net::HTTP::Post.new(uri.request_uri)
				request.body = @event_data.to_json

				
			end
		rescue Timeout::Error
			$stderr.print "Timed out while creating Boundary Event"
		end
	end

	private

	def api_key_encode(key)
		encoded_key = Base64.encode64(key).strip
		encoded_key.gsub("\n", "")
	end
end
