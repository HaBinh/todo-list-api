class List < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    validates  :title,    presence: true
    def self.search(search)
        if search 
          where("title LIKE ?", "%#{search}%")    
        else
          all
        end 
    end
end
