require 'active_support/concern'
require 'active_support/core_ext/hash/except'
require 'ripple/translation'
require 'ripple/embedded_document/around_callbacks'
require 'ripple/embedded_document/finders'
require 'ripple/embedded_document/persistence'
require 'ripple/properties'
require 'ripple/attribute_methods'
require 'ripple/timestamps'
require 'ripple/validations'
require 'ripple/associations'
require 'ripple/callbacks'
require 'ripple/conversion'
require 'ripple/inspection'
require 'ripple/nested_attributes'
require 'ripple/serialization'

module Ripple
  # Represents a document model that is composed into or stored in a parent
  # Document.  Embedded documents may also embed other documents, have
  # callbacks and validations, but are solely dependent on the parent Document.
  module EmbeddedDocument
    extend ActiveSupport::Concern
    include Translation

    included do
      extend ActiveModel::Naming
      include Persistence
      extend Ripple::Properties
      include Ripple::AttributeMethods
      include Ripple::Indexes
      include Ripple::Timestamps
      include Ripple::Validations
      include Ripple::Associations
      include Ripple::Callbacks
      include Ripple::EmbeddedDocument::AroundCallbacks
      include Ripple::Conversion
      include Finders
      include Ripple::Inspection
      include Ripple::NestedAttributes
      include Ripple::Serialization
    end

    module ClassMethods
      def embeddable?
        true
      end
    end

    def ==(other)
      self.class == other.class &&
        _parent_document == other._parent_document &&
        serializable_hash == other.serializable_hash
    end
    alias eql? ==

    def hash
      hash  = self.class.hash ^ _parent_document.class.hash ^ serializable_hash.to_s.hash
      hash ^= _parent_document.key.hash if _parent_document.respond_to?(:key)
      hash
    end
  end
end
