class Category < ApplicationRecord
  belongs_to :post, optional: true
  has_many :posts
end
