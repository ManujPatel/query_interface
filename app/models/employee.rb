class Employee < ApplicationRecord
    # frozen_string_literal: true
    validates :first_name, :last_name, :email, :age, :salary, presence: true
    validates :age, :salary, numericality: true
    validates :email, uniqueness: true
end
