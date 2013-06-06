#encoding: utf-8

class UsersController < ApplicationController
  def mymusics
    respond_to do |format|
      format.html
    end
  end

  def following
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
    end  	
  end

  def followers
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
    end  	
  end


	def show
		@friend = User.find_by_identifier(params[:identifier])
	end
end