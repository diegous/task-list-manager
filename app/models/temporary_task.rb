class TemporaryTask < Task
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :percentage, absence: true

  validate :start_is_lower_than_end

  def expired?
    end_date <= Date.today
  end

  def valid_states
    super << 'expired'
  end

  private

  def start_is_lower_than_end
    unless start_date.nil? || end_date.nil?
      errors.add(:start_date, "should be before end date") if start_date > end_date
    end
  end
end
