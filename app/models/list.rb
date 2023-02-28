class List < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :user
  has_and_belongs_to_many :allowed_users, class_name: 'User', join_table: :lists_users

  validates :title, presence: true

  def author?(user_id)
    self.user_id == user_id
  end
end
