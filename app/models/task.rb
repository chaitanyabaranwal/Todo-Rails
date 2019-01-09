class Task < ApplicationRecord
    has_and_belongs_to_many :categories
    belongs_to :user

    validates :name, presence: true, length: { minimum: 5, maximum: 30 }
    validate :due_date_in_future

    def self.search(term)
        if term
            where('name LIKE ?', "%#{term}%").order('id DESC')
        else
            all.order('id DESC')
        end
    end

    private
    def due_date_in_future
        if !due_date.blank? && due_date < Date.today
            self.errors.add(:due_date, "cannot be in the past")
        end
    end
end
