require "self_harm_detector/sensitive_content/data"
module SelfHarmDetector
    # Specify this act if you want to save the analysis to persist on your model
    #
    #   class Post < ActiveRecord::Base
    #     detect_self_harm_on :field_of_choice
    #   end
    #
    # Assumes there is a detections table present
    module Detector
        extend ActiveSupport::Concern

        CALLBACKS = [:analyze_for_self_harm]

        module ClassMethods
            def self_harm_detector(options = {})
                include SelfHarmDetector::Detector::SelfHarmDetectorInstanceMethods

                raise ArgumentError, "No attributes specified" if options.empty?

                # TODO: Check column type text
                # TODO: Accomodate action text and remove requirement for text

                class_attribute :detector_options, instance_writer: false
                self.detector_options = options

                after_save :analyze_for_self_harm

                define_callbacks :self_harm_detector
            end
        end

        module SelfHarmDetectorInstanceMethods
            def analyze_for_self_harm
                # TODO: Be smarter about this, only run if focus attribute is changed

                # Find the detection for the given detectable and attribute
                detection = Detection.find_by(detectable: detectable, attribute: detector_options[:only].to_sym).first_or_create

                # Calculate the score (count the number of matches)
                count = SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.filter{ |phrase| 
                    self.send(detector_options[:only].to_sym).downcase.scan(/(?=#{phrase.downcase})/).count > 0
                }.count

                detection.update(score: count)
            end
        end
    end
end