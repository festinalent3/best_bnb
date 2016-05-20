class DateRange

  def self.generate_range(from_date, to_date)
    return false if (from_date == '' || to_date == '')
    return [*Date.parse(from_date)..Date.parse(to_date)]
  end

  def self.book_dates(book_from, book_to, range)
    booked_range = self.generate_range(book_from, book_to)
    booked_range.pop
    mark_booked_dates(booked_range, range)
  end

  def self.request_dates(from_date, to_date, user_id)
    return ({user_id.to_s.to_sym => {:check_in_date => from_date, :check_out_date => to_date}})
  end

  def self.update_requests(book_from, range)
    range.delete_if do |hash|
      date_is_booked(book_from, hash)
    end
  end

  private

  def self.mark_booked_dates(b_range, range)
    arr = []
    range.each do |date|
      date == b_range.first ? arr << :booked && b_range.shift : arr << date
    end
    range = arr
  end

  def self.date_is_booked(book_from, hash)
    dates = hash.values
    check_in = dates[0].values[0]
    if check_in == book_from
      true
    end
  end

end