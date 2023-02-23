class List < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :user

  validates :title, presence: true
end
