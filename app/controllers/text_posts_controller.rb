class TextPostsController < ApplicationController
    before_action :find_text_post, only: [:show, :edit, :update, :destroy]

    def index
        @text_posts = TextPost.all
        
    end
    
    def show
        @text_post = TextPost.find(params[:id])
    end

    def new
        @text_post = current_user.text_posts.build
    end


    def edit
        @text_post = TextPost.find(params[:id])
    end

    def create
        @text_post = current_user.text_posts.build(description: params[:text_post][:description], name: params[:text_post][:name])
    if  @text_post.save
        redirect_to text_posts_path
    else
         @errors = @text_post.errors
         render :new
    end
    end

    def update
        @text_post = TextPost.find(params[:id])
    if  @text_post.update(description: params[:text_post][:description], name: params[:text_post][:name])
        redirect_to text_posts_path
    else
        @errors = @text_post.errors
        render :edit
    end
    end

   
    def destroy
        
        @text_post.destroy
        redirect_to text_posts_path
    
    end
private

def text_post_params
    params.require(:text_post).permit(:description, :name)
end

def find_text_post
    @text_post = TextPost.find(params[:id])
   
end    
       
end
