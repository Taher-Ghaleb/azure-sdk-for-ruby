# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Information about the formal API definition for the web app.
    #
    class ApiDefinitionInfo

      include MsRestAzure

      # @return [String] The URL of the API definition.
      attr_accessor :url

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

        serialized_property = object.url
        output_object['url'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ApiDefinitionInfo] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ApiDefinitionInfo.new

        deserialized_property = object['url']
        output_object.url = deserialized_property

        output_object
      end
    end
  end
end
