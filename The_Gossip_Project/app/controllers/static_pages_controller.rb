class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def show_cities
    @city = City.all
  end
  
end
