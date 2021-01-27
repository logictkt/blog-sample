class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :content, presence: true

  scope :posted, -> { order(created_at: :desc) }

  def owner?(target_user)
    user == target_user
  end
end
