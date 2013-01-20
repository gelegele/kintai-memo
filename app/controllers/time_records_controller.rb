class TimeRecordsController < ApplicationController
  # GET /time_records
  # GET /time_records.json
  def index
    existing_time_records = User.find(session[:user_id]).time_records
 
    today = Date.today
    year = today.year
    month = today.month
    days_of_month = Date.new(year, month, -1).day
    @time_records = Array.new
    for day in 1..days_of_month do
      existing_time_record = nil
      date = Date.new(year, month, day)
      for item in existing_time_records do
        if date == item.date
          existing_time_record = item
          break
        end
      end
      if existing_time_record
        @time_records << existing_time_record
      else
        @time_records << TimeRecord.new(date: date)
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
    @time_record.user_id = session[:user_id] if session[:user_id]
    now = Time.now
    if params[:date] 
      @time_record.date = Date.parse(params[:date])
    else
      @time_record.date = now 
    end
    @time_record.in = Time.local(now.year, now.month, now.day, 9)
    @time_record.out = Time.local(now.year, now.month, now.day, 17, 30)

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
