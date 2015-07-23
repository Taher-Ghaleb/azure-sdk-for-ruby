# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module AzureNetworkManagement
  module Models
    #
    # Model object.
    #
    class ApplicationGatewayBackendAddress
      # @return [String] Gets or sets the dns name
      attr_accessor :fqdn

      # @return [String] Gets or sets the ip address
      attr_accessor :ip_address

      #
      # Validate the object. Throws ArgumentError if validation fails.
      #
      def validate
        # Nothing to validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.fqdn
        output_object['fqdn'] = serialized_property unless serialized_property.nil?

        serialized_property = object.ip_address
        output_object['ipAddress'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ApplicationGatewayBackendAddress] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ApplicationGatewayBackendAddress.new

        deserialized_property = object['fqdn']
        output_object.fqdn = deserialized_property

        deserialized_property = object['ipAddress']
        output_object.ip_address = deserialized_property

        output_object.validate

        output_object
      end
    end
  end
end
