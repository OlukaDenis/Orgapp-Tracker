class User < ApplicationRecord
  before_save :name_downcase
  validates :name, presence: true,
                   uniqueness: { message: 'Username already taken, choose a different username!' },
                   length: { in: 6..20 }

  has_many :author_projects, foreign_key: 'author_id', class_name: 'Project',
                             dependent: :destroy
  has_many :author_groups, foreign_key: 'author_id', class_name: 'Group',
                           dependent: :destroy

  private

  def name_downcase
    self.name = name.downcase
  end
end
