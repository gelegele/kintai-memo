class TimeRecordsController < ApplicationController
  # GET /time_records
  # GET /time_records.json
  def index

    today = Date.today
 
    if params[:monthly_id]
      session[:monthly] = current_user.monthlies.find(params[:monthly_id])
    elsif session[:monthly]
      session[:monthly] = current_user.monthlies.find(session[:monthly].id)
    else
      if current_user.monthlies.empty?
        current_user.monthlies.create(year:today.year, month:today.month)
      end
      session[:monthly] = current_user.monthlies[0]
    end
    existing_time_records = session[:monthly].time_records

    @monthliesHash = Hash.new
    current_user.monthlies.each do |monthly|
      @monthliesHash[monthly.year] = Array.new unless @monthliesHash[monthly.year]
      @monthliesHash[monthly.year] << monthly
    end

    days_of_month = Date.new(session[:monthly].year, session[:monthly].month, -1).day
    @time_records = Array.new
    for day in 1..days_of_month do
      existing = nil
      date = Date.new(session[:monthly].year, session[:monthly].month, day)
      for item in existing_time_records do
        if date == item.date
          existing = item
          break
        end
      end
      if existing
        @time_records << existing
      else
        @time_records << TimeRecord.new(monthly_id: session[:monthly].id, date: date)
      end
    end

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
    @time_record = TimeRecord.new
    @time_record.monthly_id = session[:monthly].id
    @time_record.date = Date.new(session[:monthly].year, session[:monthly].month, params[:day].to_i)
    @time_record.in = Time.local(session[:monthly].year, session[:monthly].month, @time_record.date.day, 9)
    @time_record.out = Time.local(session[:monthly].year, session[:monthly].month, @time_record.date.day, 17, 30)

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

    respond_to do |format|
      if @time_record.save
        format.html { redirect_to action: 'index' }
        format.json { render json: @time_record, status: :created, location: @time_record }
      else
        format.html { render action: "new" }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_records/1
  # PUT /time_records/1.json
  def update
    @time_record = TimeRecord.find(params[:id])

    respond_to do |format|
      if @time_record.update_attributes(params[:time_record])
        format.html { redirect_to action:'index' }
        format.json { head :no_content }
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
    @time_record.destroy

    respond_to do |format|
      format.html { redirect_to time_records_url }
      format.json { head :no_content }
      format.js # destroy.js.erb
    end
  end
end
