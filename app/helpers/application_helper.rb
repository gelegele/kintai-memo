module ApplicationHelper
  def strf_day(time)
    time.strftime("%d %a") if time
  end

  def strf_time(time)
    time.strftime("%H:%M") if time
  end

  def strf_monthly(monthly)
    monthly.year.to_s + "-" + monthly.month.to_s.rjust(2, "0") if monthly
  end
end
