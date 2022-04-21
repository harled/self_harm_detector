# frozen_string_literal: true

RSpec.describe SelfHarmDetector do
  it "has a version number" do
    expect(SelfHarmDetector::VERSION).not_to be nil
  end

  it "detects lack of self harm intent" do
    expect(SelfHarmDetector.detect(text: "I really love myself today")).to be 0
  end

  it "detects self harm intent" do
    expect(SelfHarmDetector.detect(text: "I want to hurt myself")).to be 1
  end

  it "detects lack of self harm intent with the concerning? interface" do
    expect(SelfHarmDetector.concerning?(text: "I really love myself today")).to be false
  end

  it "detects self harm intent with the concerning? interface" do
    expect(SelfHarmDetector.concerning?(text: "I want to hurt myself")).to be true
  end
end
