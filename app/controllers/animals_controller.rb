class AnimalsController < ApplicationController
  def show
    @animal = Animal.find_by(slug: params[:slug])
  end
end
