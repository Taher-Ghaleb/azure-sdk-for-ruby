# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Storage
  #
  # The Storage Management Client.
  #
  class StorageAccounts
    include Azure::ARM::Storage::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the StorageAccounts class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the StorageManagementClient
    attr_reader :client

    #
    # Checks that account name is valid and is not in use.
    #
    # @param account_name [StorageAccountCheckNameAvailabilityParameters] The name
    # of the storage account within the specified resource group. Storage account
    # names must be between 3 and 24 characters in length and use numbers and
    # lower-case letters only.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def check_name_availability(account_name, custom_headers = nil)
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      account_name.validate unless account_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless account_name.nil?
        account_name = StorageAccountCheckNameAvailabilityParameters.serialize_object(account_name)
      end
      request_content = JSON.generate(account_name, quirks_mode: true)
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.Storage/checkNameAvailability'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = CheckNameAvailabilityResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Asynchronously creates a new storage account with the specified parameters.
    # Existing accounts cannot be updated with this API and should instead use
    # the Update Storage Account API. If an account is already created and
    # subsequent PUT request is issued with exact same set of properties, then
    # HTTP 200 would be returned.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param parameters [StorageAccountCreateParameters] The parameters to provide
    # for the created account.
    # @param @client.api_version [String] Client Api Version.
    # @param @client.subscription_id [String] Gets subscription credentials which
    # uniquely identify Microsoft Azure subscription. The subscription ID forms
    # part of the URI for every service call.
    # @param @client.accept_language [String] Gets or sets the preferred language
    # for the response.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def create(resource_group_name, account_name, parameters, custom_headers = nil)
      # Send request
      promise = begin_create(resource_group_name, account_name, parameters, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          unless parsed_response.nil?
            parsed_response = StorageAccount.deserialize_object(parsed_response)
          end
        end

        # Waiting for response.
        @client.get_put_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Asynchronously creates a new storage account with the specified parameters.
    # Existing accounts cannot be updated with this API and should instead use
    # the Update Storage Account API. If an account is already created and
    # subsequent PUT request is issued with exact same set of properties, then
    # HTTP 200 would be returned.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param parameters [StorageAccountCreateParameters] The parameters to provide
    # for the created account.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def begin_create(resource_group_name, account_name, parameters, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      parameters.validate unless parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless parameters.nil?
        parameters = StorageAccountCreateParameters.serialize_object(parameters)
      end
      request_content = JSON.generate(parameters, quirks_mode: true)
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :put, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 202
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccount.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Deletes a storage account in Microsoft Azure.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def delete(resource_group_name, account_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :delete, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Returns the properties for the specified storage account including but not
    # limited to name, account type, location, and account status. The ListKeys
    # operation should be used to retrieve storage keys.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def get_properties(resource_group_name, account_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccount.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Updates the account type or tags for a storage account. It can also be used
    # to add a custom domain (note that custom domains cannot be added via the
    # Create operation). Only one custom domain is supported per storage account.
    # In order to replace a custom domain, the old value must be cleared before a
    # new value may be set. To clear a custom domain, simply update the custom
    # domain with empty string. Then call update again with the new cutsom domain
    # name. The update API can only be used to update one of tags, accountType,
    # or customDomain per call. To update multiple of these properties, call the
    # API multiple times with one change per call. This call does not change the
    # storage keys for the account. If you want to change storage account keys,
    # use the RegenerateKey operation. The location and name of the storage
    # account cannot be changed after creation.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param parameters [StorageAccountUpdateParameters] The parameters to update
    # on the account. Note that only one property can be changed at a time using
    # this API.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def update(resource_group_name, account_name, parameters, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      parameters.validate unless parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless parameters.nil?
        parameters = StorageAccountUpdateParameters.serialize_object(parameters)
      end
      request_content = JSON.generate(parameters, quirks_mode: true)
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :patch, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccount.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Lists the access keys for the specified storage account.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param account_name [String] The name of the storage account.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list_keys(resource_group_name, account_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}/listKeys'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccountKeys.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Lists all the storage accounts available under the subscription. Note that
    # storage keys are not returned; use the ListKeys operation for this.
    #
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list(custom_headers = nil)
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.Storage/storageAccounts'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccountListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Lists all the storage accounts available under the given resource group.
    # Note that storage keys are not returned; use the ListKeys operation for
    # this.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def list_by_resource_group(resource_group_name, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccountListResult.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Regenerates the access keys for the specified storage account.
    #
    # @param resource_group_name [String] The name of the resource group within
    # the user's subscription.
    # @param account_name [String] The name of the storage account within the
    # specified resource group. Storage account names must be between 3 and 24
    # characters in length and use numbers and lower-case letters only.
    # @param regenerate_key [StorageAccountRegenerateKeyParameters] Specifies name
    # of the key which should be regenerated. key1 or key2 for the default keys
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def regenerate_key(resource_group_name, account_name, regenerate_key, custom_headers = nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'regenerate_key is nil' if regenerate_key.nil?
      regenerate_key.validate unless regenerate_key.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless regenerate_key.nil?
        regenerate_key = StorageAccountRegenerateKeyParameters.serialize_object(regenerate_key)
      end
      request_content = JSON.generate(regenerate_key, quirks_mode: true)
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}/regenerateKey'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'accountName' => account_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = StorageAccountKeys.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
