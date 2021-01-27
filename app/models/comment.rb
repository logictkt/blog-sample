# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_note_id  (note_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  note_id  (note_id => notes.id)
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :content, presence: true

  scope :posted, -> { order(created_at: :desc) }

  def owner?(target_user)
    user == target_user
  end
end
