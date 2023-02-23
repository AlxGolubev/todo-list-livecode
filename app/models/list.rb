class List < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :title, presence: true
end
