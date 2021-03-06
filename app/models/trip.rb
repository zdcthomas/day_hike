class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_trail_length
    trails.sum(:length)
  end

  def average_trail_length
    unless self.trails.empty?
      trails.average(:length).round(2).to_f
    else
      0
    end
  end

  def max_trail_length
    unless self.trails.empty?
      trails.maximum(:length)
    else
      0
    end
  end
  def min_trail_length
    unless self.trails.empty?
      trails.minimum(:length)
    else
      0
    end
  end
end
