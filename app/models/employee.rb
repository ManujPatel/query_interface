class Employee < ApplicationRecord
    validates :first_name, :last_name, :email, :age, :salary, presence: true
    validates :age, :salary, numericality: true
end
