class Profile
  include Ripple::Document

  one :user, :using => :key

  property :color, String
end
