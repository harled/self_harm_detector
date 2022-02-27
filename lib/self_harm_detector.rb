require_relative "self_harm_detector/version"
require_relative "self_harm_detector/sensitive_content/data"

# Specify this act to access the detect_self_harm method. Returns
# a count of direct matches to the inputted string.
#   class Post
#     include SelfHarmDetector
#   end
#   self_harm_matches = post.detect_self_harm(text: post.description)
#
#   Expects a text to be a string
module SelfHarmDetector
  # TODO: Add ActiveRecord support
  # TODO: Add attribute to call to automatically score it on save with `attribute_name_self_harm_score`
  # TODO: Add rubocop 
  # TODO: Add rspec tests
  # TODO: Add build and test badges to readme
  # TODO: Add example use case case to readme
  # TODO: Add usage to readme
  def self.included(base)
    def detect_self_harm(text:)
      SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.keys.filter{ |phrase| 
          # TODO: Remove symbols and numbers
          text.downcase.scan(/(?=#{phrase.to_s.downcase})/).count > 0
      }.count
    end
  end
end