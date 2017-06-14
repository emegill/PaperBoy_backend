class ChosensitesController < ApplicationController
    def index
        array_of_sites = Chosensite.where(feed_id: params[:feed_id])

        p array_of_sites

        array_push = [];
        site = array_of_sites.map do |site|
            array_push.push(site[:newssite_id])
        end
        p array_push
        new_york_times = array_push.include? 1
        intercept = array_push.include? 2
        guardian = array_push.include? 3
        jacobin = array_push.include? 4
        billypen = array_push.include? 5
        aljazeera = array_push.include? 6
        bbc = array_push.include? 7

        p valueHash = {NewYorkTimes: new_york_times, Intercept: intercept, Guardian: guardian, Jacobin: jacobin, BillyPen: billypen, Aljazeera: aljazeera, Bbc: bbc}
        render json: valueHash
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


end
