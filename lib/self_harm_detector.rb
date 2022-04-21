require_relative "self_harm_detector/version"
require_relative "self_harm_detector/sensitive_content/data"

# Specify this act to access the detect method. Returns
# a count of direct matches to the inputted string.
#   self_harm_matches = SelfHarmDetector.detect(text: "A sample set of text")
#
#   Expects a text to be a string
module SelfHarmDetector
  def self.detect(text:)
    SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.keys.count { |phrase|
      text.downcase.scan(/(?=#{phrase.to_s.downcase})/).count > 0
    }
  end

  def self.concerning?(text:, threshold: 0)
    detect(text: text) > threshold
  end
end
