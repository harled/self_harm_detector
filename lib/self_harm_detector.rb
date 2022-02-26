require_relative "self_harm_detector/version"
require_relative "self_harm_detector/sensitive_content/data"

# Specify this act to access the detect_self_harm method. Returns
# a count of direct matches to the inputted string.
#   class Post
#     include SelfHarmDetector
#   end
module SelfHarmDetector
  def self.included(base)
    def detect_self_harm(text:)
      SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.keys.filter{ |phrase| 
          text.downcase.scan(/(?=#{phrase.to_s.downcase})/).count > 0
      }.count
    end
  end
end