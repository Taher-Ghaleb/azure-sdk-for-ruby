# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CDN::Mgmt::V2020_04_15
  #
  # A service client - single point of access to the REST API.
  #
  class CdnManagementClient < MsRestAzure::AzureServiceClient
    include MsRestAzure
    include MsRestAzure::Serialization

    # @return [String] the base URI of the service.
    attr_accessor :base_url

    # @return Credentials needed for the client to connect to Azure.
    attr_reader :credentials

    # @return [String] Azure Subscription ID.
    attr_accessor :subscription_id

    # @return [String] Version of the API to be used with the client request.
    # Current version is 2017-04-02.
    attr_reader :api_version

    # @return [String] The preferred language for the response.
    attr_accessor :accept_language

    # @return [Integer] The retry timeout in seconds for Long Running
    # Operations. Default value is 30.
    attr_accessor :long_running_operation_retry_timeout

    # @return [Boolean] Whether a unique x-ms-client-request-id should be
    # generated. When set to true a unique x-ms-client-request-id value is
    # generated and included in each request. Default is true.
    attr_accessor :generate_client_request_id

    # @return [Profiles] profiles
    attr_reader :profiles

    # @return [Endpoints] endpoints
    attr_reader :endpoints

    # @return [Origins] origins
    attr_reader :origins

    # @return [OriginGroups] origin_groups
    attr_reader :origin_groups

    # @return [CustomDomains] custom_domains
    attr_reader :custom_domains

    # @return [ResourceUsageOperations] resource_usage_operations
    attr_reader :resource_usage_operations

    # @return [Operations] operations
    attr_reader :operations

    # @return [EdgeNodes] edge_nodes
    attr_reader :edge_nodes

    # @return [Policies] policies
    attr_reader :policies

    # @return [ManagedRuleSets] managed_rule_sets
    attr_reader :managed_rule_sets

    #
    # Creates initializes a new instance of the CdnManagementClient class.
    # @param credentials [MsRest::ServiceClientCredentials] credentials to authorize HTTP requests made by the service client.
    # @param base_url [String] the base URI of the service.
    # @param options [Array] filters to be applied to the HTTP requests.
    #
    def initialize(credentials = nil, base_url = nil, options = nil)
      super(credentials, options)
      @base_url = base_url || 'https://management.azure.com'

      fail ArgumentError, 'invalid type of credentials input parameter' unless credentials.is_a?(MsRest::ServiceClientCredentials) unless credentials.nil?
      @credentials = credentials

      @profiles = Profiles.new(self)
      @endpoints = Endpoints.new(self)
      @origins = Origins.new(self)
      @origin_groups = OriginGroups.new(self)
      @custom_domains = CustomDomains.new(self)
      @resource_usage_operations = ResourceUsageOperations.new(self)
      @operations = Operations.new(self)
      @edge_nodes = EdgeNodes.new(self)
      @policies = Policies.new(self)
      @managed_rule_sets = ManagedRuleSets.new(self)
      @api_version = '2020-04-15'
      @accept_language = 'en-US'
      @long_running_operation_retry_timeout = 30
      @generate_client_request_id = true
      add_telemetry
    end

    #
    # Makes a request and returns the body of the response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Hash{String=>String}] containing the body of the response.
    # Example:
    #
    #  request_content = "{'location':'westus','tags':{'tag1':'val1','tag2':'val2'}}"
    #  path = "/path"
    #  options = {
    #    body: request_content,
    #    query_params: {'api-version' => '2016-02-01'}
    #  }
    #  result = @client.make_request(:put, path, options)
    #
    def make_request(method, path, options = {})
      result = make_request_with_http_info(method, path, options)
      result.body unless result.nil?
    end

    #
    # Makes a request and returns the operation response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [MsRestAzure::AzureOperationResponse] Operation response containing the request, response and status.
    #
    def make_request_with_http_info(method, path, options = {})
      result = make_request_async(method, path, options).value!
      result.body = result.response.body.to_s.empty? ? nil : JSON.load(result.response.body)
      result
    end

    #
    # Makes a request asynchronously.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def make_request_async(method, path, options = {})
      fail ArgumentError, 'method is nil' if method.nil?
      fail ArgumentError, 'path is nil' if path.nil?

      request_url = options[:base_url] || @base_url
      if(!options[:headers].nil? && !options[:headers]['Content-Type'].nil?)
        @request_headers['Content-Type'] = options[:headers]['Content-Type']
      end

      request_headers = @request_headers
      request_headers.merge!({'accept-language' => @accept_language}) unless @accept_language.nil?
      options.merge!({headers: request_headers.merge(options[:headers] || {})})
      options.merge!({credentials: @credentials}) unless @credentials.nil?

      super(request_url, method, path, options)
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [CheckNameAvailabilityOutput] operation results.
    #
    def check_name_availability(check_name_availability_input, custom_headers:nil)
      response = check_name_availability_async(check_name_availability_input, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def check_name_availability_with_http_info(check_name_availability_input, custom_headers:nil)
      check_name_availability_async(check_name_availability_input, custom_headers:custom_headers).value!
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def check_name_availability_async(check_name_availability_input, custom_headers:nil)
      fail ArgumentError, 'check_name_availability_input is nil' if check_name_availability_input.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = accept_language unless accept_language.nil?

      # Serialize Request
      request_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::CheckNameAvailabilityInput.mapper()
      request_content = self.serialize(request_mapper,  check_name_availability_input)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'providers/Microsoft.Cdn/checkNameAvailability'

      request_url = @base_url || self.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = self.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::CheckNameAvailabilityOutput.mapper()
            result.body = self.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [CheckNameAvailabilityOutput] operation results.
    #
    def check_name_availability_with_subscription(check_name_availability_input, custom_headers:nil)
      response = check_name_availability_with_subscription_async(check_name_availability_input, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def check_name_availability_with_subscription_with_http_info(check_name_availability_input, custom_headers:nil)
      check_name_availability_with_subscription_async(check_name_availability_input, custom_headers:custom_headers).value!
    end

    #
    # Check the availability of a resource name. This is needed for resources where
    # name is globally unique, such as a CDN endpoint.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] Input to
    # check.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def check_name_availability_with_subscription_async(check_name_availability_input, custom_headers:nil)
      fail ArgumentError, 'check_name_availability_input is nil' if check_name_availability_input.nil?
      fail ArgumentError, 'subscription_id is nil' if subscription_id.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = accept_language unless accept_language.nil?

      # Serialize Request
      request_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::CheckNameAvailabilityInput.mapper()
      request_content = self.serialize(request_mapper,  check_name_availability_input)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/providers/Microsoft.Cdn/checkNameAvailability'

      request_url = @base_url || self.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => subscription_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = self.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::CheckNameAvailabilityOutput.mapper()
            result.body = self.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Check if the probe path is a valid path and the file can be accessed. Probe
    # path is the path to a file hosted on the origin server to help accelerate the
    # delivery of dynamic content via the CDN endpoint. This path is relative to
    # the origin path specified in the endpoint configuration.
    #
    # @param validate_probe_input [ValidateProbeInput] Input to check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ValidateProbeOutput] operation results.
    #
    def validate_probe(validate_probe_input, custom_headers:nil)
      response = validate_probe_async(validate_probe_input, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Check if the probe path is a valid path and the file can be accessed. Probe
    # path is the path to a file hosted on the origin server to help accelerate the
    # delivery of dynamic content via the CDN endpoint. This path is relative to
    # the origin path specified in the endpoint configuration.
    #
    # @param validate_probe_input [ValidateProbeInput] Input to check.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def validate_probe_with_http_info(validate_probe_input, custom_headers:nil)
      validate_probe_async(validate_probe_input, custom_headers:custom_headers).value!
    end

    #
    # Check if the probe path is a valid path and the file can be accessed. Probe
    # path is the path to a file hosted on the origin server to help accelerate the
    # delivery of dynamic content via the CDN endpoint. This path is relative to
    # the origin path specified in the endpoint configuration.
    #
    # @param validate_probe_input [ValidateProbeInput] Input to check.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def validate_probe_async(validate_probe_input, custom_headers:nil)
      fail ArgumentError, 'validate_probe_input is nil' if validate_probe_input.nil?
      fail ArgumentError, 'subscription_id is nil' if subscription_id.nil?
      fail ArgumentError, 'api_version is nil' if api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = accept_language unless accept_language.nil?

      # Serialize Request
      request_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::ValidateProbeInput.mapper()
      request_content = self.serialize(request_mapper,  validate_probe_input)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/providers/Microsoft.Cdn/validateProbe'

      request_url = @base_url || self.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => subscription_id},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = self.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::CDN::Mgmt::V2020_04_15::Models::ValidateProbeOutput.mapper()
            result.body = self.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end


    private
    #
    # Adds telemetry information.
    #
    def add_telemetry
        sdk_information = 'azure_mgmt_cdn'
        sdk_information = "#{sdk_information}/0.18.1"
        add_user_agent_information(sdk_information)
    end
  end
end
