class Event < ApplicationRecord

  
  validates :start_date, presence: true, numericality: { less_than: Time.now }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, length:{ in:5..140}
  validates :description, presence: true, length:{ in:20..1000}
  validates :price, presence: true, length:{ in:1..1000}
  validates :location, presence: true
  
  has_many :attendances

  def duration
    if  (duration %5 == 1  ) = false
    errors.add(:duration, 'must be multiple of 5')
    end
  end
end