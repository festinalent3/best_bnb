class DateRange

  attr_reader :range

  def initialize(from_date, to_date)
    @range = self.generate_range(from_date, to_date)
  end

  def generate_range(from_date, to_date)
    return [*Date.parse(from_date)..Date.parse(to_date)]
  end

  def book_dates(book_from, book_to)
    booked_range = self.generate_range(book_from, (book_to))
    booked_range.pop
    mark_booked_dates(booked_range)
  end



  private

  def mark_booked_dates(b_range, arr = [])
      @range.each do |date|
        date == b_range.first ? arr << :booked && b_range.shift : arr << date
      end
      @range = arr
  end

end
