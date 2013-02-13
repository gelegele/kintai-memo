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

  def strf_double(value)
    format("%02d", value)
  end

  def year_list
    thisYear = Time.now.year
    ((thisYear + 2).downto(thisYear - 2)).to_a
  end

  def month_list
    (1..12).to_a
  end

  def hours_list
    (0..23).to_a.map{|v|[strf_double(v), v]}
  end

  def minutes_list
    [0,10,20,30,40,50].map{|v|[strf_double(v), v]}
  end
end
