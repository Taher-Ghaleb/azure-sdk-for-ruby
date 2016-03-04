# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  module Models
    #
    # Request parameters for create a new group
    #
    class GroupCreateParameters

      include MsRestAzure

      # @return [String] Group display name
      attr_accessor :display_name

      # @return [Boolean] Mail
      attr_accessor :mail_enabled

      # @return [String] Mail nick name
      attr_accessor :mail_nickname

      # @return [Boolean] Is security enabled
      attr_accessor :security_enabled

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property display_name is nil' if @display_name.nil?
        fail MsRest::ValidationError, 'property mail_enabled is nil' if @mail_enabled.nil?
        fail MsRest::ValidationError, 'property mail_nickname is nil' if @mail_nickname.nil?
        fail MsRest::ValidationError, 'property security_enabled is nil' if @security_enabled.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.display_name
        output_object['displayName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.mail_enabled
        output_object['mailEnabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.mail_nickname
        output_object['mailNickname'] = serialized_property unless serialized_property.nil?

        serialized_property = object.security_enabled
        output_object['securityEnabled'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [GroupCreateParameters] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = GroupCreateParameters.new

        deserialized_property = object['displayName']
        output_object.display_name = deserialized_property

        deserialized_property = object['mailEnabled']
        output_object.mail_enabled = deserialized_property

        deserialized_property = object['mailNickname']
        output_object.mail_nickname = deserialized_property

        deserialized_property = object['securityEnabled']
        output_object.security_enabled = deserialized_property

        output_object
      end
    end
  end
end
