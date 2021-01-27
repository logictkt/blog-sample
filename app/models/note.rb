# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
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
