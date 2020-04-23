# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::RecoveryServices::Mgmt::V2016_06_01
  module Models
    #
    # Gets or sets private link service connection state.
    #
    class PrivateLinkServiceConnectionState

      include MsRestAzure

      # @return [PrivateEndpointConnectionStatus] Gets or sets the status.
      # Possible values include: 'Pending', 'Approved', 'Rejected',
      # 'Disconnected'
      attr_accessor :status

      # @return [String] Gets or sets description.
      attr_accessor :description

      # @return [String] Gets or sets actions required.
      attr_accessor :actions_required


      #
      # Mapper for PrivateLinkServiceConnectionState class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PrivateLinkServiceConnectionState',
          type: {
            name: 'Composite',
            class_name: 'PrivateLinkServiceConnectionState',
            model_properties: {
              status: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'status',
                type: {
                  name: 'String'
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'description',
                type: {
                  name: 'String'
                }
              },
              actions_required: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'actionsRequired',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
