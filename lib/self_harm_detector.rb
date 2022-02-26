require_relative "self_harm_detector/version"
require_relative "self_harm_detector/sensitive_content/data"

module SelfHarmDetector
  def self.included(base)
    def detect_self_harm(text:)
      SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.keys.filter{ |phrase| 
          text.downcase.scan(/(?=#{phrase.to_s.downcase})/).count > 0
      }.count
    end
  end
end