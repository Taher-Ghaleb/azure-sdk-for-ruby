# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes Protocol and thumbprint of Windows Remote Management listener
    #
    class WinRMListener

      include MsRestAzure

      # @return [ProtocolTypes] Gets or sets the Protocol used by WinRM
      # listener. Currently only Http and Https are supported. Possible
      # values include: 'Http', 'Https'
      attr_accessor :protocol

      # @return [String] Gets or sets the Certificate URL in KMS for Https
      # listeners. Should be null for Http listeners.
      attr_accessor :certificate_url

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.protocol
        output_object['protocol'] = serialized_property unless serialized_property.nil?

        serialized_property = object.certificate_url
        output_object['certificateUrl'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [WinRMListener] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = WinRMListener.new

        deserialized_property = object['protocol']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = ProtocolTypes.constants.any? { |e| ProtocolTypes.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum ProtocolTypes does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.protocol = deserialized_property

        deserialized_property = object['certificateUrl']
        output_object.certificate_url = deserialized_property

        output_object
      end
    end
  end
end
