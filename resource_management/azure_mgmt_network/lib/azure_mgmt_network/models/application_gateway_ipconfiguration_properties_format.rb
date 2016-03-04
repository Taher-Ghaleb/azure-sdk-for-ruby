# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Properties of IP configuration of application gateway
    #
    class ApplicationGatewayIPConfigurationPropertiesFormat

      include MsRestAzure

      # @return [SubResource] Gets or sets the reference of the subnet
      # resource.A subnet from where appliation gateway gets its private
      # address
      attr_accessor :subnet

      # @return [String] Gets or sets Provisioning state of the application
      # gateway subnet resource Updating/Deleting/Failed
      attr_accessor :provisioning_state

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @subnet.validate unless @subnet.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.subnet
        unless serialized_property.nil?
          serialized_property = SubResource.serialize_object(serialized_property)
        end
        output_object['subnet'] = serialized_property unless serialized_property.nil?

        serialized_property = object.provisioning_state
        output_object['provisioningState'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ApplicationGatewayIPConfigurationPropertiesFormat]
      # Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ApplicationGatewayIPConfigurationPropertiesFormat.new

        deserialized_property = object['subnet']
        unless deserialized_property.nil?
          deserialized_property = SubResource.deserialize_object(deserialized_property)
        end
        output_object.subnet = deserialized_property

        deserialized_property = object['provisioningState']
        output_object.provisioning_state = deserialized_property

        output_object
      end
    end
  end
end
