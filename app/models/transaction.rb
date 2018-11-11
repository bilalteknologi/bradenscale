class Transaction < ApplicationRecord
    has_many :subtransaction
    belongs_to :useralias, foreign_key: "user_id", class_name: "User"
end
