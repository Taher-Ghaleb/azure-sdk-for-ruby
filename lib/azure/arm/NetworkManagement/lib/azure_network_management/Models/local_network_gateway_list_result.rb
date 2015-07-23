# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module AzureNetworkManagement
  module Models
    #
    # Model object.
    #
    class LocalNetworkGatewayListResult
      # @return [Array<LocalNetworkGateway>] Gets List of LocalNetworkGateways
      # that exists in a resource group
      attr_accessor :value

      # @return [String] Gets the URL to get the next set of results.
      attr_accessor :next_link

      def initialize
        @value = [];
      end

      #
      # Validate the object. Throws ArgumentError if validation fails.
      #
      def validate
        @value.each{ |e| e.validate if e.respond_to?(:validate) } unless @value.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.value
        if (serialized_property)
          serializedArray = [];
          serialized_property.each do |element|
            if (element)
              element = AzureNetworkManagement::Models::LocalNetworkGateway.serialize_object(element)
            end
            serializedArray.push(element);
          end
          serialized_property = serializedArray;
        end
        output_object['value'] = serialized_property unless serialized_property.nil?

        serialized_property = object.next_link
        output_object['nextLink'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [LocalNetworkGatewayListResult] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = LocalNetworkGatewayListResult.new

        deserialized_property = object['value']
        if (deserialized_property)
          deserializedArray = [];
          deserialized_property.each do |element1|
            if (element1)
              element1 = AzureNetworkManagement::Models::LocalNetworkGateway.deserialize_object(element1)
            end
            deserializedArray.push(element1);
          end
          deserialized_property = deserializedArray;
        end
        output_object.value = deserialized_property

        deserialized_property = object['nextLink']
        output_object.next_link = deserialized_property

        output_object.validate

        output_object
      end
    end
  end
end
