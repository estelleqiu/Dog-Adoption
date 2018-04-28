class AnimalsController < ApplicationController
  def show
    @animal = Animal.find(params[:id])
  end
end
