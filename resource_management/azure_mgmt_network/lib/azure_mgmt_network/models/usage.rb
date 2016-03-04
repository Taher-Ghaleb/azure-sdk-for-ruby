# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Describes Network Resource Usage.
    #
    class Usage

      include MsRestAzure

      # @return [UsageUnit] Gets or sets an enum describing the unit of
      # measurement. Possible values include: 'Count'
      attr_accessor :unit

      # @return [Integer] Gets or sets the current value of the usage.
      attr_accessor :current_value

      # @return [Integer] Gets or sets the limit of usage.
      attr_accessor :limit

      # @return [UsageName] Gets or sets the name of the type of usage.
      attr_accessor :name

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property unit is nil' if @unit.nil?
        fail MsRest::ValidationError, 'property current_value is nil' if @current_value.nil?
        fail MsRest::ValidationError, 'property limit is nil' if @limit.nil?
        fail MsRest::ValidationError, 'property name is nil' if @name.nil?
        @name.validate unless @name.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.unit
        output_object['unit'] = serialized_property unless serialized_property.nil?

        serialized_property = object.current_value
        output_object['currentValue'] = serialized_property unless serialized_property.nil?

        serialized_property = object.limit
        output_object['limit'] = serialized_property unless serialized_property.nil?

        serialized_property = object.name
        unless serialized_property.nil?
          serialized_property = UsageName.serialize_object(serialized_property)
        end
        output_object['name'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [Usage] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = Usage.new

        deserialized_property = object['unit']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = UsageUnit.constants.any? { |e| UsageUnit.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum UsageUnit does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.unit = deserialized_property

        deserialized_property = object['currentValue']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.current_value = deserialized_property

        deserialized_property = object['limit']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.limit = deserialized_property

        deserialized_property = object['name']
        unless deserialized_property.nil?
          deserialized_property = UsageName.deserialize_object(deserialized_property)
        end
        output_object.name = deserialized_property

        output_object
      end
    end
  end
end
