class Note < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_rich_text :content

  validates :title, presence: true

  scope :posted, -> { order(created_at: :desc) }

  def owner?(target_user)
    user == target_user
  end
end
