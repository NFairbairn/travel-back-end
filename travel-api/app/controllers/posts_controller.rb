
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
        images.each do |image|

        s3 = Aws::S3::Resource.new(region: 'us-west-2')
        s3_bucket = s3.bucket(ENV["S3_BUCKET"])
        image_body = Base64.decode64(image.uri.split(',')[1])
        image_content = image.uri.split(':')[1].split(';').flatten[0]
        image_obj = s3_bucket.object((0..8).map { (65 + rand(26)).chr }.join + image.uri)
        image_obj.put(body: image_body, acl: 'public-read', content_type: image_content, content_encoding: 'base64')
        # aws_image = Image.create(user_id: image_params[:user_id], trail_id: image_params[:trail_id], img_url: image_obj.public_url)
            
        
        Image.create(collection: collection, alt: "", uri: image_obj.public_url)
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
