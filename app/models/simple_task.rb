class SimpleTask < Task
  validates :start_date, :end_date, :percentage, absence: true
end
