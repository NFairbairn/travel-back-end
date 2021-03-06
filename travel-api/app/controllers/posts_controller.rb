
require 'aws-sdk'

class PostsController < ApplicationController

    def index
        posts = Post.all.order('created_at DESC')
        render json: posts, include: [:collection, :images]
    end

    def create
        # params[:images].each do |image|
        #     puts image.uri
        # end
        # create a new post
        post = Post.create(title: params[:title], preview: params[:preview], content: params[:content], blog_id: params[:blog_id], location_id: params[:location_id])
        # create a new collection associated with that post
        collection = Collection.create(post_id: post.id)

        images = params[:images]
        # iterate over each image ad create a new image instance associated with that collection
        # counter = 1
        images.each do |image|
            Image.create(collection: collection, alt: "", uri: image["uri"])
            # @s3.put_object(bucket: @bucket, key: counter, body: "pls")
            # counter += 1
        end
        render json: post, include: :images
    end

    def destroy
        post = Post.find(params[:id])
        posts = Post.all.order('created_at DESC')
        
        post.delete

        render json: posts, include: [:collection, :images]
    end
end
