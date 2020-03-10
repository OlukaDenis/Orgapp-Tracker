class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :groupings
    has_many :projects, through: :groupings

    validates :name, presence: true
end
