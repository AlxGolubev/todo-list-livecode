class List < ApplicationRecord
  has_many :tasks

  validates :title, presence: true
end
