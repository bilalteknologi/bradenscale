class Transaction < ApplicationRecord
    has_many :subtransaction
end
