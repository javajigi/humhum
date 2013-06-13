#encoding: utf-8

class MusicsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.all
    @music = Music.new

    @friends = Array.new
    me = FbGraph::User.new('me', :access_token => current_user.authentication_token).fetch
    
    raw_friends = me.friends 
    raw_friends.each do |raw_friend|
      @friends << raw_friend if User.find_by_identifier(raw_friend.identifier)
    end
    puts '########'+@friends.inspect
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musics }
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @music = Music.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.json
  def new
    @music = Music.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/1/edit
  def edit
    @music = Music.find(params[:id])
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(params[:music])
    @music.user_name = current_user.username
    @music.user_picture = current_user.user_picture

    # params[:person][:picture] 수정
    mp3_filename = params[:music][:filename]
    File.open(Rails.root.join('public', 'uploads', mp3_filename.original_filename), 'wb') do |file|
      file.write(mp3_filename.read)
    end

    album_picture_filename = params[:music][:album_picture]
    File.open(Rails.root.join('public', 'uploads', album_picture_filename.original_filename), 'wb') do |file|
      file.write(album_picture_filename.read)
    end

    @music.filename = mp3_filename.original_filename
    @music.album_picture = album_picture_filename.original_filename

    respond_to do |format|
      if @music.save
        format.html { redirect_to "/musics" }
        format.json { render json: @music, status: :created, location: @music }
      else
        format.html { render action: "new" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musics/1
  # PUT /musics/1.json
  def update
    @music = Music.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to musics_url }
      format.json { head :no_content }
    end
  end
end