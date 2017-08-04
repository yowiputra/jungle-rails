class Review < ActiveRecord::Base
  belongs_to :product

  validates :user_id, presence: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
