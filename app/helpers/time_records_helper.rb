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
end
