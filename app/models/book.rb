class Book < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :user
  validates :body, length:{maximum: 200}
end
