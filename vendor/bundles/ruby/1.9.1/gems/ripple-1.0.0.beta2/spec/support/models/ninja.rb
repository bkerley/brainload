class Ninja < User
  property :name, String

  def key
    "ninja-#{name.downcase}"
  end
end
