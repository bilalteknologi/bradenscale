class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tran, foreign_key: "transaction_id", class_name: "Transaction"

  enum level: { user: 2, admin: 1 }
end
