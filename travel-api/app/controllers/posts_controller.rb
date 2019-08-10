class PostsController < ApplicationController

    def index 
        posts = Post.all
        render json: posts, include: [:collection, :images]
    end

    def create
        # byebug
        post = Post.create(title: params[:title], preview: params[:preview], content: params[:content], blog_id: params[:blog_id], location_id: params[:location_id])
        render json: post
    end
end
