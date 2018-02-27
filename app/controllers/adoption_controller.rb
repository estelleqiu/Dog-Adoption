class AdoptionController < ApplicationController
  def index
    @all_animal = Animal.all
  end
end
