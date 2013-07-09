class PlacesController < ApplicationController
  
  def index
    @places = Place.all

    @cafes = Place.where(:category_id=>1)
    @restaurants = Place.where(:category_id=>2)
    @groceries = Place.where(:category_id=>3)



    respond_to do |format|
      format.html # index.html.erb
      format.json {render :file => "places/all.json.erb", :content_type => 'application/json'}
    end
  end

  def show
    @place = Place.find(params[:id])
   


    respond_to do |format|
      format.html # show.html.erb
      #format.json { render 'places.json.erb' }

    end
  end

  def new
    @place = Place.new
    @place.reviews.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(params[:place])
    #String processing the text number into a pure number
    input_num = @place.phone
    @place.phone = input_num.to_s.gsub(/[^0-9]/, '') if input_num
   # flash[:notice] = "Added your Vegan Place successfully"
    respond_to do |format|
      if @place.save
        format.html { redirect_to mainmenu_url, notice: 'This location was successfully added to our Vegan database!' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to mainmenu_url, notice: 'OK. We have updated this location' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
end
