class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_and_belongs_to_many :reactions
end
