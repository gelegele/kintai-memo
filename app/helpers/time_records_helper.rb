module TimeRecordsHelper
  def current_year?(year)
    session[:monthly].year == year
  end

  def current_month?(year, month)
    session[:monthly].month == month && session[:monthly].year == year
  end

  def wday_class(date)
    if @holidays.include?(date)
      'tr-holiday'
    elsif date.wday == 0
      'tr-holiday'
    elsif date.wday == 6
      "tr-saturday"
    else
      "tr-weekday"
    end
  end

  def time_records_path_with_monthly(monthly)
    time_records_path + "?monthly_id=" + monthly.id.to_s
  end
end
