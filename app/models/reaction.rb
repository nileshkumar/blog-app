class Reaction < ApplicationRecord
  has_and_belongs_to_many :comments
end
