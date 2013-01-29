class MonthliesController < ApplicationController
  # GET /monthlies
  # GET /monthlies.json
  def index
    @monthlies = current_user.monthlies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monthlies }
    end
  end

  # GET /monthlies/1
  # GET /monthlies/1.json
  def show
    @monthly = current_user.monthlies.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monthly }
    end
  end

  # GET /monthlies/new
  # GET /monthlies/new.json
  def new
    @monthly = current_user.monthlies.new
    if current_user.monthlies.empty?
      today = Date.today
      @monthly.year = today.year
      @monthly.month = today.month
    else
      latest = current_user.monthlies[0]
      if 12 == latest.month
        @monthly.year = latest.year + 1
        @monthly.month = 1
      else
        @monthly.year = latest.year
        @monthly.month = latest.month + 1
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monthly }
      # show modal form in time_records index
      format.js { render :partial => 'new_modal'}
    end
  end

  # POST /monthlies
  # POST /monthlies.json
  def create
    @monthly = current_user.monthlies.new(params[:monthly])

    respond_to do |format|
      if @monthly.save
        session[:monthly] = @monthly
        #format.html { redirect_to @monthly, notice: 'Monthly was successfully created.' }
        format.html { redirect_to time_records_url }
        format.json { render json: @monthly, status: :created, location: @monthly }
      else
        format.html { render action: "new" }
        format.json { render json: @monthly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthlies/1
  # DELETE /monthlies/1.json
  def destroy
    @monthly = current_user.monthlies.find(params[:id])
    @monthly.destroy
    session[:monthly] = nil if session[:monthly] == @monthly

    respond_to do |format|
      #format.html { redirect_to monthlies_url }
      format.html { redirect_to time_records_url }
      format.json { head :no_content }
    end
  end
end
