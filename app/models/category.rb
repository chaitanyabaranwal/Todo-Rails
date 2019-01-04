class Category < ApplicationRecord
    has_and_belongs_to_many :tasks
    belongs_to :user

    validates :name, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 10}

    def self.search(term)
        if term
            where('name LIKE ?', "%#{term}%").order('id DESC')
        else
            all.order('id DESC')
        end
    end
end
