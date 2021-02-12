class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @cities = City.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def new
  end

  def edit
  end
end
