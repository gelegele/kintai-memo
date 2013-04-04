class TimeRecordsController < ApplicationController
  # GET /time_records
  # GET /time_records.json
  def index

    if params[:monthly_id]
      session[:monthly] = current_user.monthlies.find(params[:monthly_id])
    else
      if session[:monthly]
        session[:monthly].reload 
      else
        session[:monthly] = current_user.monthlies[0]
      end
    end

    @time_records = newTimeRecordArray(session[:monthly])
    @monthlyHash = newMonthlyHash
    @holidays = findHolidays(session[:monthly])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_records }
    end
  end

  # GET /time_records/1
  # GET /time_records/1.json
  def show
    @time_record = TimeRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_record }
    end
  end

  # GET /time_records/new
  # GET /time_records/new.json
  def new
    @time_record = newTimeRecord(session[:monthly], params[:day])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_record }
      format.js { render 'modal_form' }
    end
  end

  # GET /time_records/1/edit
  def edit
    @time_record = TimeRecord.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @time_record }
      format.js { render 'modal_form' }
    end
  end

  # POST /time_records
  # POST /time_records.json
  def create
    @time_record = TimeRecord.new(params[:time_record])
    @holidays = findHolidays(session[:monthly])

    respond_to do |format|
      if @time_record.save
        format.html { redirect_to action: 'index' }
        format.json { render json: @time_record, status: :created, location: @time_record }
        format.js { render action: 'update' }
      else
        format.html { render action: "new" }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_records/1
  # PUT /time_records/1.json
  def update
    #TODO 
    if session[:monthly].time_records.exists?(params[:id])
      @time_record = session[:monthly].time_records.find(params[:id])
    else
      @time_record = TimeRecord.find(params[:id])
    end
    @holidays = findHolidays(session[:monthly])

    respond_to do |format|
      if @time_record.update_attributes(params[:time_record])
        format.html { redirect_to action: 'index' }
        format.json { head :no_content }
        format.js # update.js.erb
      else
        format.html { render action: "edit" }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_records/1
  # DELETE /time_records/1.json
  def destroy
    @time_record = TimeRecord.find(params[:id])
    if session[:monthly].time_records.exists?(@time_record.id)
      session[:monthly].time_records.delete(@time_record)
    else
      @time_record.destroy
    end
    @holidays = findHolidays(session[:monthly])

    respond_to do |format|
      format.html { redirect_to time_records_url }
      format.json { head :no_content }
      format.js { render action: 'update' }
    end
  end


  private
  def newTimeRecordArray(monthly)
    time_records = Array.new
    if monthly
      days_of_month = Date.new(monthly.year, monthly.month, -1).day
      for day in 1..days_of_month do
        existing = nil
        date = Date.new(monthly.year, monthly.month, day)
        for item in monthly.time_records do
          if date == item.date
            existing = item
            break
          end
        end
        if existing
          time_records << existing
        else
          time_records << TimeRecord.new(monthly_id: monthly.id, date: date)
        end
      end
    end
    time_records
  end

  private
  def newMonthlyHash
    monthlyHash = Hash.new
    current_user.monthlies.each do |monthly|
      monthlyHash[monthly.year] = Array.new unless monthlyHash[monthly.year]
      monthlyHash[monthly.year] << monthly
    end
    monthlyHash
  end

  private
  def findHolidays(monthly)
    holidays = []
    if monthly
      firstDay = Date.new(monthly.year, monthly.month, 1)
      lastDay = Date.new(monthly.year, monthly.month, -1)
      Holiday.where(date: firstDay..lastDay).each do |h|
        holidays << h.date
      end
    end
    holidays
  end

  private
  def newTimeRecord(monthly, day)
    time_record = TimeRecord.new
    if day
      time_record.date = Date.new(monthly.year, monthly.month, day.to_i)
      in_hour, in_minute = 9, 0
      out_hour, out_minute = 17, 30
      # Set Fixed Time
      if current_user.time_tables.any?
        time_table = current_user.time_tables[0]
        in_hour = time_table.fixed_start_hours
        in_minute = time_table.fixed_start_minutes
        out_hour = time_table.fixed_end_hours
        out_minute = time_table.fixed_end_minutes
      end
      # Set out time now if today
      if time_record.date == Date.today
        out_time = Time.new(
          time_record.date.year, time_record.date.month, time_record.date.day,
          out_hour, out_minute) 
        now = Time.now
        if out_time <= now
          out_hour = now.hour
          out_minute = now.min - now.min%10
        end
      end
      time_record.in = Time.local(
        monthly.year, monthly.month, time_record.date.day, in_hour, in_minute)
      time_record.out = Time.local(
        monthly.year, monthly.month, time_record.date.day, out_hour, out_minute)
    end
    time_record.monthly_id = monthly.id
    time_record
  end
end
