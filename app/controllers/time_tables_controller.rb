class TimeTablesController < ApplicationController
  # GET /time_tables
  # GET /time_tables.json
  def index
    @time_tables = current_user.time_tables
    @working_times = @time_tables[0].working_times if @time_tables.any?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_tables }
    end
  end

  # GET /time_tables/1
  # GET /time_tables/1.json
  def show
    @time_table = current_user.time_tables.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_table }
    end
  end

  # GET /time_tables/new
  # GET /time_tables/new.json
  def new
    @time_table = TimeTable.new
    @time_table.user_id = current_user.id
    @time_table.fixed_start_hours = 9
    @time_table.fixed_start_minutes = 0
    @time_table.fixed_end_hours = 17
    @time_table.fixed_end_minutes = 30
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_table }
    end
  end

  # GET /time_tables/1/edit
  def edit
    @time_table = current_user.time_tables.find(params[:id])
  end

  # POST /time_tables
  # POST /time_tables.json
  def create
    @time_table = TimeTable.new(params[:time_table])

    respond_to do |format|
      if current_user.time_tables << @time_table
        format.html { redirect_to time_tables_url }
        format.json { render json: @time_table, status: :created, location: @time_table }
      else
        format.html { render action: "new" }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_tables/1
  # PUT /time_tables/1.json
  def update
    @time_table = current_user.time_tables.find(params[:id])

    respond_to do |format|
      if @time_table.update_attributes(params[:time_table])
        format.html { redirect_to time_tables_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tables/1
  # DELETE /time_tables/1.json
  def destroy
    @time_table = TimeTable.find(params[:id])
    @time_table.destroy

    respond_to do |format|
      format.html { redirect_to time_tables_url }
      format.json { head :no_content }
    end
  end
end
