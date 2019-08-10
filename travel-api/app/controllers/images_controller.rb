class ImagesController < ApplicationController

    def index 
        images = Image.all
        render json: images
    end

    def show
        image = Image.find(params[:id])
        render json: image
    end

    def create
        image = Image.create(collection: c1, uri: params[:uri], alt: params[:alt])
        render json: image
    end
end
