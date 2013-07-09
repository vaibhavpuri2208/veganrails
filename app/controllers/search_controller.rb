class SearchController < ApplicationController

  def new
    #method to initiate a new search
  end

  def find
    #method to process the SQL Query


    search_name = "%#{params[:place][:name]}%"

    search_cuisine = Cuisine.where("name LIKE ?", search_name)
    
    search_city = City.where("name LIKE?", search_name)


    unless search_cuisine.empty? 
      search_cuisine_id = search_cuisine.first.id  
    end


    unless search_city.empty?

      search_city_id = search_city.first.id
    end
    
    @places = Place.where("name LIKE ? OR description LIKE? OR address LIKE? OR cuisine_id =? OR city_id=?",search_name,search_name,search_name,search_cuisine_id,search_city_id)
    #("SELECT COUNT(*) FROM "places"  WHERE (name CONTAINs '%Test%')")

    #@places = Place.find_by_sql("SELECT places.* FROM places WHERE (name LIKE '%Test%' OR description LIKE'%Test%' OR address LIKE'%Test%' OR cuisine_id =NULL OR city_id=NULL)")               

    #    @places = Place.find_by_sql("SELECT * FROM places (CONTAINS(name, 'Vaibhav'))") 

    # SELECT * FROM table WHERE CONTAINS(Column, 'test');


    @places = [] if @places.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end





end
