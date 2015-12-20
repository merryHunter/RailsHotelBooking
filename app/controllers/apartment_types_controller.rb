class ApartmentTypesController < ApplicationController
  before_filter :authenticate_admin
  # GET /apartment_types
  # GET /apartment_types.json
  def index
    # @apartment_types = ApartmentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apartment_types }
    end
  end

  # GET /apartment_types/1
  # GET /apartment_types/1.json
  def show
    @apartment_type = ApartmentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment_type }
    end
  end

  # GET /apartment_types/new
  # GET /apartment_types/new.json
  def new
    @apartment_type = ApartmentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apartment_type }
    end
  end

  # GET /apartment_types/1/edit
  def edit
    @apartment_type = ApartmentType.find(params[:id])
  end

  # POST /apartment_types
  # POST /apartment_types.json
  def create
    @apartment_type = ApartmentType.new(params[:apartment_type])

    respond_to do |format|
      if @apartment_type.save
        format.html { redirect_to @apartment_type, notice: 'Apartment type was successfully created.' }
        format.json { render json: @apartment_type, status: :created, location: @apartment_type }
      else
        format.html { render action: "new" }
        format.json { render json: @apartment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apartment_types/1
  # PUT /apartment_types/1.json
  def update
    @apartment_type = ApartmentType.find(params[:id])

    respond_to do |format|
      if @apartment_type.update_attributes(params[:apartment_type])
        format.html { redirect_to @apartment_type, notice: 'Apartment type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apartment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_types/1
  # DELETE /apartment_types/1.json
  def destroy
    @apartment_type = ApartmentType.find(params[:id])
    @apartment_type.destroy

    respond_to do |format|
      format.html { redirect_to apartment_types_url }
      format.json { head :no_content }
    end
  end
end
