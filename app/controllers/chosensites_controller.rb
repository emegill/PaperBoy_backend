class ChosensitesController < ApplicationController

  def create
    Chosensite.create(chosensite_params)
    
  end

  private

  def chosensite_params

    params.require(:data).permit(:feed_id, :newssite_id)
  end

end
