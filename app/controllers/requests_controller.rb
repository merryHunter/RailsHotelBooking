class RequestsController < ApplicationController
  before_filter :init
  before_filter :authenticate_admin, only: [:show, :index, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(status: -1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    if current_user.admin?
      @available_rooms = get_available_rooms @request
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    logger.debug("POST REQUEST CREATE")
    @request = Request.new(params[:request])
    @request.type_id = params[:type_id]
    @request.user_id = current_user.id
    @request.status = -1
    respond_to do |format|
      if @request.save
        format.html { redirect_to bookings_path, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  def assign
    booking = Booking.new
    @request = Request.find(params[:id])
    booking.room_id = params[:room_id]
    booking.user_id = @request.user_id
    booking.entry = @request.entry
    booking.final = @request.final
    @request.status = 1
    logger.debug(@request.to_s)
    logger.debug(booking.to_s)
    if booking.save && @request.save
      respond_to do |format|
        format.html { redirect_to requests_url , notice: "Assigned!"}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to requests_url , notice: "Error"}
        format.json { head :no_content }
      end
      end
  end


  def reject
    @request = Request.find(params[:id])
    @request.status = 0
    if @request.save
          respond_to do |format|
            format.html { redirect_to requests_url , notice: "Rejected!"}
            format.json { head :no_content }
          end
      end
  end

  # TODO:production connection setup!
  # TODO:test sql query!!! no
  private
    def get_available_rooms(request)
      rooms = Room.all
      bookings = Booking.all
      results = []
      rooms.each do |r|
        flag = true
        if r.persons >= request.persons.to_i and r.type_id == request.type_id.to_s
          bookings.each do |b|
            logger.debug(b.final)
            logger.debug(b.final.to_s)
            if b.room_id == r.id and !((b.final < request.entry) || (b.entry > request.final))
                  flag = false
                  break
            end
          end
          if flag
                results << r
          end
        end
      end
      results
    end

    def init
      @apartment_hash = init_apartment_types_hash
    end
end
