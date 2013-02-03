class WorkingTimesController < ApplicationController
  # GET /working_times
  # GET /working_times.json
  def index
    @working_times = current_user.working_times

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @working_times }
    end
  end

  # GET /working_times/1
  # GET /working_times/1.json
  def show
    @working_time = current_user.working_times.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @working_time }
    end
  end

  # GET /working_times/new
  # GET /working_times/new.json
  def new
    @working_time = WorkingTime.new
    @working_time.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @working_time }
    end
  end

  # GET /working_times/1/edit
  def edit
    @working_time = current_user.working_times.find(params[:id])
  end

  # POST /working_times
  # POST /working_times.json
  def create
    @working_time = WorkingTime.new(params[:working_time])

    respond_to do |format|
      if current_user.working_times << @working_time
        format.html { redirect_to working_times_path }
        format.json { render json: @working_time, status: :created, location: @working_time }
      else
        format.html { render action: "new" }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /working_times/1
  # PUT /working_times/1.json
  def update
    @working_time = current_user.working_times.find(params[:id])

    respond_to do |format|
      if @working_time.update_attributes(params[:working_time])
        format.html { redirect_to working_times_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_times/1
  # DELETE /working_times/1.json
  def destroy
    @working_time = current_user.working_times.find(params[:id])
    @working_time.destroy

    respond_to do |format|
      format.html { redirect_to working_times_url }
      format.json { head :no_content }
    end
  end
end
