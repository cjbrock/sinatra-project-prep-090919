class PostsController < ApplicationController
    get '/posts' do
        @posts = Post.all
        erb :"posts/index"
    end

    get '/posts/new' do
        @users = User.all
        erb :"posts/new"
    end

    get '/posts/:id/edit' do
        @users = User.all
        @post = Post.find_by_id(params[:id])
        erb :"posts/edit"
    end

    patch '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        params.delete("_method")
        if @post.update(params)
            redirect "/posts/#{@post.id}"
        else
            redirect "/posts/#{@post.id}/edit"
        end
    end

    get '/posts/:id' do
        @post = Post.find_by_id(params["id"])
        erb :"posts/show"
    end

    post '/posts' do
        post = Post.new(params)
        if post.save
            redirect "/posts/#{post.id}"
        else
            redirect "/posts/new"
        end
    end



end