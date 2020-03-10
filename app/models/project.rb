class Project < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :groupings
    has_many :groups, through: :groupings

    validates :name, presence: true
    validates :duration, presence: true
    validates :author_id, presence: true
    
end
