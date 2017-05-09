class NewWordsController < ApplicationController
  before_action :set_new_word, only: [:show, :update, :destroy]

  # GET /new_words
  # GET /new_words.json
  def index
    @new_words = NewWord.all
  end

  # GET /new_words/1
  # GET /new_words/1.json
  def show
  end

  # POST /new_words
  # POST /new_words.json
  def create
    @new_word = NewWord.new(new_word_params)

    if @new_word.save
      render :show, status: :created, location: @new_word
    else
      render json: @new_word.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /new_words/1
  # PATCH/PUT /new_words/1.json
  def update
    if @new_word.update(new_word_params)
      render :show, status: :ok, location: @new_word
    else
      render json: @new_word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /new_words/1
  # DELETE /new_words/1.json
  def destroy
    @new_word.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_word
      @new_word = NewWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_word_params
      params.require(:new_word).permit(:word, :type, :valid, :user_id)
    end
end
