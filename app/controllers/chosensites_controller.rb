class ChosensitesController < ApplicationController

  def create
    Chosensite.create(chosensite_params)

  end

  def destroy
      site = Chosensite.where!(newssite_id: chosensite_delete_params).first

      site.delete!
  end

  private

  def chosensite_params

    params.require(:data).permit(:feed_id, :newssite_id)
  end

  def chosensite_delete_params
      params.require(:chosensite).permit(:newssite_id)

  end

end
