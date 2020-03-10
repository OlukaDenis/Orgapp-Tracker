class User < ApplicationRecord
    validates :name, presence: true, uniqueness: { message: "Username already taken, choose a different username!"}
end
