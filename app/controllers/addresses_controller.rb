class AddressesController < ApplicationController

  def index
    #render text: "params : #{params.inspect}"
    addresses = Address.all
    render json: addresses.to_json, status: 200
  end

  def new
    #render text: "params : #{params.inspect}"
    render json: Address.new
  end

  def show
    #render text: "params : #{params.inspect}"
    if Address.exists?(params[:id])
      address = Address.find(params[:id])
      render json: Address.to_json, status: 200
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
      # address = Address.create(body: params[:body]) => this is the same as the (3) lines below
      address = Address.new
      address.body = params[:body]
      address.save
      render json: address.to_json, status: 201
    end
  end

  def destroy
    #render text: "params : #{params.inspect}"
    if Address.exists?(params[:id])
      address = Address.find(params[:id])
      address.destroy
      render json: { message: "address Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def update
    #render text: "params : #{params.inspect}"
      if Address.exists?(params[:id])
        update_address_status = Address.update(params[:id], completed: params[:completed])
        render json: update_address_status, status: 200
     else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
     end
  end
end
