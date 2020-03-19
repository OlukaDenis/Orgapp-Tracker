class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :projects, through: :groupings, dependent: :destroy

  validates :name, presence: true,
                   length: { in: 4..100 }

  scope :alphabet_order, -> { order(name: :asc) }
  mount_uploader :icon, PictureUploader
end
