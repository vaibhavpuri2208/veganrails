class HackathonsController < ApplicationController
  def index
    @hackathons = Hackathon.all
    set_accessors
    format_hash
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hackathons_formatted }
    end
  end

  def format_hash
    @hackathons.each_index do |index|
      @original_hash = Hash.new { |hash, key| hash[key] = @hackathons[index][key] }
      @new_hash = Hash.new
      @new_hash[:city] = @original_hash[:city]
      @new_hash[:hacks] = Array.new
      insert_hash = Hash.new
      insert_hash.merge! access_hash(:info, @original_hash[:info])
      insert_hash.merge! access_hash(:date, @original_hash[:date])
      insert_hash.merge! access_hash(:where, @original_hash[:where])
      insert_hash.merge! access_hash(:name, @original_hash[:name])
      @new_hash[:hacks].push insert_hash
      test_for_dup


    end
  end

  def test_for_dup
    @flag = false

    @hackathons_formatted.each_index do |index|

      if @hackathons_formatted[index][:city]== @new_hash[:city]
        @flag = true
        @hackathons_formatted[index][:hacks].push @new_hash[:hacks][0]
        break
      end
    end

    if !@flag
      @hackathons_formatted.push @new_hash
      @flag =false

    end

  end



  def access_hash(key,value)
    temp = Hash.new
    temp[key] = value
    temp
  end

  def set_accessors
    @hackathons_formatted = Array.new
  end


  def show
    @hackathon = Hackathon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hackathon }
    end
  end

  # GET /hackathons/new
  # GET /hackathons/new.json
  def new
    @hackathon = Hackathon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hackathon }
    end
  end

  # GET /hackathons/1/edit
  def edit
    @hackathon = Hackathon.find(params[:id])
  end

  # POST /hackathons
  # POST /hackathons.json
  def create
    @hackathon = Hackathon.new(params[:hackathon])

    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render json: @hackathon, status: :created, location: @hackathon }
      else
        format.html { render action: "new" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hackathons/1
  # PUT /hackathons/1.json
  def update
    @hackathon = Hackathon.find(params[:id])

    respond_to do |format|
      if @hackathon.update_attributes(params[:hackathon])
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackathons/1
  # DELETE /hackathons/1.json
  def destroy
    @hackathon = Hackathon.find(params[:id])
    @hackathon.destroy

    respond_to do |format|
      format.html { redirect_to hackathons_url }
      format.json { head :no_content }
    end
  end
end
