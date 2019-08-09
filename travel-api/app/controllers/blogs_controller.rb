class BlogsController < ApplicationController

    def index 
        blogs = Blog.all
        render json: blogs
    end

    def show
        blog = Blog.find(params[:id])
        render json: blog
    end

    def create 
        blog = Blog.create(title: params[:title], description: params[:description], user: params[:user])
        render json: blog
    end
end
