module ApplicationHelper
  def strf_day(time)
    time.strftime("%d %a") if time
  end

  def strf_time(time)
    time.strftime("%H:%M") if time
  end
end
