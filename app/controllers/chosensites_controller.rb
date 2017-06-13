class ChosensitesController < ApplicationController
    def index
        Chosensite.where(chosensite_component_will_mount)
    end
  def create
    Chosensite.create(chosensite_params)

  end

  def destroy
      site = Chosensite.where(chosensite_delete_params).first

      site.destroy!
  end

  private

  def chosensite_params

    params.require(:data).permit(:feed_id, :newssite_id)
  end

  def chosensite_delete_params
      params.require(:chosensite).permit(:feed_id,:newssite_id)

  end

  def chosensite_component_will_mount
      params.require(:data).permit(:feed_id)

  end

end
