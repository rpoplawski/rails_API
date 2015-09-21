class UsersController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    users = User.all
    render json: users.to_json, status: 200
  end

  def new
    #render text: "params : #{params.inspect}"
    render json: User.new
  end

  def show
    #render text: "params : #{params.inspect}"
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    #render text: "params : #{params.inspect}"
      user = User.new
      user.first_name = params[:first_name]
      user.last_name =  params[:last_name]
      user.age =        params[:age]
      user.save
      render json: user.to_json, status: 201
  end

  def destroy
    #render text: "params : #{params.inspect}"
    if User.exists?(params[:id])
      user = User.find(params[:id])
      user.destroy
      render json: { message: "User Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def update
    #render text: "params : #{params.inspect}"
      if User.exists?(params[:id])
        update_user_status = User.update(params[:id], completed: params[:completed])
        render json: update_user_status, status: 200
     else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
     end
  end
end
