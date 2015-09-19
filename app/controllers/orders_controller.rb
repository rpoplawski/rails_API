class OrdersController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    orders = Order.all
    render json: orders.to_json, status: 200
  end

  def new
    #render text: "params : #{params.inspect}"
    render json: Order.new
  end

  def show
    #render text: "params : #{params.inspect}"
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      render json: Order.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    #render text: "params : #{params.inspect}"
    if params[:item_id].nil? || params[:item_id].empty?
       err_msg = "The 'item_id' parameter was empty or not found"
       render json: { error_msg: err_msg }.to_json, status: 422

    elsif params[:user_id].nil? || params[:user_id].empty?
      err_msg = "The 'user_id' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422

    elsif params[:quantity].nil? || params[:quantity].empty?
      err_msg = "The 'quantity' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      order = Order.new
      order.item_id  = params[:item_id]
      order.user_id  = params[:user_id]
      order.quantity = params[:quantity]
      order.save
      render json: order.to_json, status: 201
    end
  end

  def update
    #render text: "params : #{params.inspect}"
      if Order.exists?(params[:id])
        order = Order.find(params[:id])
        order.item_id  = params[:item_id]  unless params[:item_id].nil?  || params[:item_id].empty?
        order.user_id  = params[:user_id]  unless params[:user_id].nil?  || params[:user_id].empty?
        order.quantity = params[:quantity] unless params[:quantity].nil? || params[:quantity].empty?
        order.save
        render json: order.to_json, status: 200
     else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
     end
  end

  def destroy
    #render text: "params : #{params.inspect}"
    #if params[:item_id].exists? && params[:user_id].exists? && params[:quantity].exists?
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      order.destroy
      render json: { message: "Order deleted successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end
end
