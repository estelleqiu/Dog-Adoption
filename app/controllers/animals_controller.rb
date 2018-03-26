class AnimalsController < ApplicationController
  def show
    @animal = Animal.find_by(slug: params[:slug])
    @animal_photos = @animal.media
  end
end
