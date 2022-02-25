# frozen_string_literal: true

require "active_record"
require_relative "self_harm_detector/version"
require "self_harm_detector/detector"

module SelfHarmDetector
end

ActiveSupport.on_load :active_record do
    require "self_harm_detector/detection"
    include SelfHarmDetector::Detector
end
