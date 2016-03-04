# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Name of a metric for any resource
    #
    class ResourceMetricName

      include MsRestAzure

      # @return [String] metric name value
      attr_accessor :value

      # @return [String] Localized metric name value
      attr_accessor :localized_value

      #
      # Validate the object. Throws ValidationError if validation fails.
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

        serialized_property = object.value
        output_object['value'] = serialized_property unless serialized_property.nil?

        serialized_property = object.localized_value
        output_object['localizedValue'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ResourceMetricName] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ResourceMetricName.new

        deserialized_property = object['value']
        output_object.value = deserialized_property

        deserialized_property = object['localizedValue']
        output_object.localized_value = deserialized_property

        output_object
      end
    end
  end
end
