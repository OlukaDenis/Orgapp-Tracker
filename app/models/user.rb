class User < ApplicationRecord
    before_save :name_downcase
    validates :name, presence: true, 
               uniqueness: { message: "Username already taken, choose a different username!"}
    has_many :author_projects, foreign_key: 'author_id', class_name: 'Project'
    has_many :author_groups, foreign_key: 'author_id', class_name: 'Group'

    private
    def name_downcase
        self.name = name.downcase
    end

end
