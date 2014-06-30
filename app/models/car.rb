class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validates_numericality_of :mileage, :greater_than_or_equal_to => 0
  validates :model_name, presence: true
  validates :year, presence: true
  validates_numericality_of :year, :greater_than_or_equal_to => 1920
  validates_numericality_of :manufacturer_id
end
