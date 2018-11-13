class Decision < ApplicationRecord

    validates :decision, presence: true
    validates :title, presence: true
    validates :begin_value, numericality: { only_integer: true }
    validates :end_value, numericality: { only_integer: true }

end
