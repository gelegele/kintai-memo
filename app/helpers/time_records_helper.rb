module TimeRecordsHelper
  def wday_class(date)
    if date.wday == 0
      'tr-holiday'
    elsif date.wday == 6
      "tr-saturday"
    else
      "tr-weekday"
    end
  end

  def current_year?(year)
    session[:monthly].year == year
  end

  def current_month?(year, month)
    session[:monthly].month == month && session[:monthly].year == year
  end
end
