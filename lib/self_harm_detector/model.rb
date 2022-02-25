require "self_harm_detector/service"
module Audited
    # Specify this act if you want to save the analysis to persist on your model
    #
    #   class Post < ActiveRecord::Base
    #     detect_self_harm_on :field_of_choice
    #   end
    #
    # Assumes there is a analysis_of_self_harm column of type text to exist on your model
    module Model
        extend ActiveSupport::Concern

        CALLBACKS = [:analyze_for_self_harm]

        module ClassMethods
            def self_harm_detector(options = {})
                include SelfHarmDetector::Model::SelfHarmDetectorInstanceMethods

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
                # count = SelfHarmDetector::SensitiveContent::Data::COMMON_SELF_HARM_PHRASES.filter{ |phrase| 
                #     self.send(detector_options[:only].to_sym).downcase.scan(/(?=#{phrase.downcase})/).count > 0
                # }.count

                # self.update(analysis_of_self_harm: count)

                puts "############### HEY ###############"
            end
        end
    end
end