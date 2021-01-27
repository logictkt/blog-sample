class User < ApplicationRecord
  include DeviseCode

  has_one_attached :image

  has_many :notes, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /^[a-zA-Z0-9_\.]*$/, multiline: true }
end
