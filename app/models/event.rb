class Event < ApplicationRecord


  validates :start_date, presence: true
  validate :time_past?
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0, if: :table_of_5?}
  validates :title, presence: true, length:{ in:5..140}
  validates :description, presence: true, length:{ in:20..1000}
  validates :price, presence: true, length:{ in:1..1000}
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances

  def time_past?
    if start_date < Date.today
      errors.add(:start_date, "impossible de planifier un évenement dans le passé !")
    end
  end


  def table_of_5?
    if (duration % 5 != 0)
      errors.add(:duration, "n'est pas un multiple de 5 !")
    end
  end
end
