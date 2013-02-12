require 'open-uri'
class HolidaysController < ApplicationController
  before_filter :authorize

  def index
    @holidays = Holiday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def pull
    for month in 1..12 do
      open(KintaiMemo::Application.config.assets.holidays_uri + params[:year] + "/" + month.to_s) do |io|
        JSON.load(io).each do |h|
          holiday = Holiday.new
          holiday.date = Time.at(h['date']/1000)
          holiday.summary = h['summary']
          holiday.save
        end
      end
    end
    redirect_to holidays_url
  end
end
