class Transaction < ApplicationRecord
    has_many :subtransaction
    belongs_to :useralias, foreign_key: "user_id", class_name: "User"


    validates :age, numericality: { only_integer: true }
    validates :name, presence: true
    validates :gender, presence: true
    validates :ruangan, presence: true
    validates :doctor, presence: true
    validates :medic_record_number, presence: true
    validates :bed_number, presence: true

end
