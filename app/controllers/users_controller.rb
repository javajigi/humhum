
#encoding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!

  def mymusics
    @user = User.find(params[:id])
    @music = Music.new
    @musics = @user.musics

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

  def follower
    @relationship = Relationship.new
    @relationship.follower = User.find_by_identifier(params[:identifier])
    @relationship.followed = current_user

    respond_to do |format|
      @relationship.save
      format.html { redirect_to "/musics" }
    end
  end

	def show
		@friend = User.find_by_identifier(params[:identifier])
	end
end