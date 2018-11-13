class Question < ApplicationRecord
    has_many :answer

    validates :question, presence: true

end
