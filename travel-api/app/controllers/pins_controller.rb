class PinsController < ApplicationController

    def show
        pin = Pin.find(params[:id])
        render json: pin
    end
end
