class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+((\s|\-)[a-zA-Z]+)*\z/i }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
    validates :phone, format: { with: /\A((\+\d{10,12})|(\d{10}))\z/i } # we want to be able to take both +359000000000 and 0000000000
end
