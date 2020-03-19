class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :groups, through: :groupings, dependent: :destroy

  validates :name, presence: true,
                   length: { in: 4..100 }
  validates :duration, presence: true
  validates :author_id, presence: true

  scope :most_recent, -> { order(created_at: :desc) }
end
