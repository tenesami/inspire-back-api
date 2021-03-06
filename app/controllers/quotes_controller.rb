class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :update, :destroy]

  # GET /quotes
  def index
    @quotes = Quote.all

    options = {
      include: [:user]
    }
    render json: QuoteSerializer.new(@quotes, options)
  end

  # GET /quotes/1
  def show
    render json: @quote
  end

  # POST /quotes
  def create
    @user = User.find_or_create_by(username: params[:quote][:username])
    @quote = @user.quotes.new(quote_params)

    if @user.save
      options = {
      include: [:user]
    }
    render json: QuoteSerializer.new(@quote, options)
    else
      render json: {errors: {user: @user.errors.full_messages, quote: @quote.errors.full_messages}}, status: :unprocessable_entity

    end
  end

  # PATCH/PUT /quotes/1
  def update
    if @quote.update(quote_params)
      render json: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  def destroy
    @quote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quote_params
      params.require(:quote).permit(:topic, :content)
    end
end
