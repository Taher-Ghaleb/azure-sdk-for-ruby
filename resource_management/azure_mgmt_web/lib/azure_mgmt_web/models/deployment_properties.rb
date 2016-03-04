# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Model object.
    #
    class DeploymentProperties

      include MsRestAzure

      # @return [String] Id
      attr_accessor :id

      # @return [Integer] Status
      attr_accessor :status

      # @return [String] Message
      attr_accessor :message

      # @return [String] Author
      attr_accessor :author

      # @return [String] Deployer
      attr_accessor :deployer

      # @return [String] AuthorEmail
      attr_accessor :author_email

      # @return [DateTime] StartTime
      attr_accessor :start_time

      # @return [DateTime] EndTime
      attr_accessor :end_time

      # @return [Boolean] Active
      attr_accessor :active

      # @return [String] Detail
      attr_accessor :details

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

        serialized_property = object.id
        output_object['id'] = serialized_property unless serialized_property.nil?

        serialized_property = object.status
        output_object['status'] = serialized_property unless serialized_property.nil?

        serialized_property = object.message
        output_object['message'] = serialized_property unless serialized_property.nil?

        serialized_property = object.author
        output_object['author'] = serialized_property unless serialized_property.nil?

        serialized_property = object.deployer
        output_object['deployer'] = serialized_property unless serialized_property.nil?

        serialized_property = object.author_email
        output_object['author_email'] = serialized_property unless serialized_property.nil?

        serialized_property = object.start_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['start_time'] = serialized_property unless serialized_property.nil?

        serialized_property = object.end_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['end_time'] = serialized_property unless serialized_property.nil?

        serialized_property = object.active
        output_object['active'] = serialized_property unless serialized_property.nil?

        serialized_property = object.details
        output_object['details'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [DeploymentProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = DeploymentProperties.new

        deserialized_property = object['id']
        output_object.id = deserialized_property

        deserialized_property = object['status']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.status = deserialized_property

        deserialized_property = object['message']
        output_object.message = deserialized_property

        deserialized_property = object['author']
        output_object.author = deserialized_property

        deserialized_property = object['deployer']
        output_object.deployer = deserialized_property

        deserialized_property = object['author_email']
        output_object.author_email = deserialized_property

        deserialized_property = object['start_time']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.start_time = deserialized_property

        deserialized_property = object['end_time']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.end_time = deserialized_property

        deserialized_property = object['active']
        output_object.active = deserialized_property

        deserialized_property = object['details']
        output_object.details = deserialized_property

        output_object
      end
    end
  end
end
