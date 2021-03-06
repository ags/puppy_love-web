require 'virtus'

# Immutable model of a photo of a Dog.
class DogPhoto
  include Virtus.value_object

  values do
    attribute :path,         String
    attribute :version_name, String
  end

  def url
    "#{ENV.fetch("CDN_HOST")}/#{path}"
  end
end
