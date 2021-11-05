class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /comments or /comments.json
  def index
    # id 2 - is admin
    if current_user.id == 2
      @comments = Comment.all
    else
      redirect_to home_about_path
    end
  end



  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new(:plot_id => params[:plot])
  end

  # GET /comments/1/edit

  # POST /comments or /comments.json
  def create
    #@comment = Comment.new(comment_params)
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: "Kommentārs ir pievienots!" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Kommentārs ir izmainīts!" }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: "Kommentārs ir dzēsts!" }
      format.json { head :no_content }
    end
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to comments_path, notice: "Nav tiesību rediģēt" if @comment.nil?
  end

  def admin

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment_text, :user_id, :plot_id )
    end
end
