class IcpcEntriesController < ApplicationController
  before_action :set_icpc_entry, only: [:show, :edit, :update, :destroy]

  # GET /icpc_entries
  # GET /icpc_entries.json
  def index
    @icpc_entries = IcpcEntry.all
  end

  # GET /icpc_entries/1
  # GET /icpc_entries/1.json
  def show
  end

  # GET /icpc_entries/new
  def new
    @icpc_entry = IcpcEntry.new
  end

  # GET /icpc_entries/1/edit
  def edit
  end

  # POST /icpc_entries
  # POST /icpc_entries.json
  def create
    @icpc_entry = IcpcEntry.new(icpc_entry_params)

    respond_to do |format|
      if @icpc_entry.save
        format.html { redirect_to @icpc_entry, notice: 'Icpc entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @icpc_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @icpc_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icpc_entries/1
  # PATCH/PUT /icpc_entries/1.json
  def update
    respond_to do |format|
      if @icpc_entry.update(icpc_entry_params)
        format.html { redirect_to @icpc_entry, notice: 'Icpc entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @icpc_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icpc_entries/1
  # DELETE /icpc_entries/1.json
  def destroy
    @icpc_entry.destroy
    respond_to do |format|
      format.html { redirect_to icpc_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icpc_entry
      @icpc_entry = IcpcEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icpc_entry_params
      params[:icpc_entry]
    end
end
