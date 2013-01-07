module ApplicationHelper
  def strf_day(time)
    time.strftime("%m-%d %a")
  end

  def strf_time(time)
    time.strftime("%H:%M")
  end
end
