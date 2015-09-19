class ItemsController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    items = Item.all
    render json: items.to_json, status: 200
  end

  def new
    #render text: "params : #{params.inspect}"
    render json: Item.new
  end

  def show
    #render text: "params : #{params.inspect}"
    if Item.exists?(params[:id])
      items = Item.find(params[:id])
      render json: Items.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    #render text: "params : #{params.inspect}"
    if params[:body].nil? || params[:body].empty?
      err_msg = "The 'message' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      # item = Item.create(body: params[:body]) => this is the same as the (3) lines below
      item = Item.new
      item.body = params[:body]
      item.save
      render json: item.to_json, status: 201
    end
  end

  def destroy
    #render text: "params : #{params.inspect}"
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      item.destroy
      render json: { message: "item Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def update
    #render text: "params : #{params.inspect}"
      if Item.exists?(params[:id])
        update_item_status = Item.update(params[:id], completed: params[:completed])
        render json: update_item_status, status: 200
     else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
     end
  end
end
