class Answer < ApplicationRecord
    belongs_to :question
    has_many :subtransaction

    validates :value, presence: true
    validates :answer, presence: true
end
