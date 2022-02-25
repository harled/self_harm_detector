module SelfHarmDetector
    class Detection < ::ActiveRecord::Base
        belongs_to :detectable, polymorphic: true

        scope :ascending, -> { order(score: :asc) }
        scope :descending, -> { order(score: :desc) }
    end
end