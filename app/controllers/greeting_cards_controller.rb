class GreetingCardsController < ApplicationController
  before_action :set_greeting_card, only: [:show, :edit, :update, :destroy]

  # GET /greeting_cards
  # GET /greeting_cards.json
  def index
    @greeting_cards = GreetingCard.all
  end

  # GET /greeting_cards/1
  # GET /greeting_cards/1.json
  def show
  end

  # GET /greeting_cards/new
  def new
    @greeting_card = GreetingCard.new
  end

  # GET /greeting_cards/1/edit
  def edit
  end

  # POST /greeting_cards
  # POST /greeting_cards.json
  def create
    @greeting_card = GreetingCard.new(greeting_card_params)
    @greeting_card.image.attach(params[:greeting_card][:image])
    respond_to do |format|
      if @greeting_card.save
        ProcessImageJob.perform_later(@greeting_card.id)
        format.html { redirect_to @greeting_card, notice: 'Greeting card was successfully created.' }
        format.json { render :show, status: :created, location: @greeting_card }
      else
        format.html { render :new }
        format.json { render json: @greeting_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greeting_cards/1
  # PATCH/PUT /greeting_cards/1.json
  def update
    respond_to do |format|
      if @greeting_card.update(greeting_card_params)
        format.html { redirect_to @greeting_card, notice: 'Greeting card was successfully updated.' }
        format.json { render :show, status: :ok, location: @greeting_card }
      else
        format.html { render :edit }
        format.json { render json: @greeting_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greeting_cards/1
  # DELETE /greeting_cards/1.json
  def destroy
    @greeting_card.destroy
    respond_to do |format|
      format.html { redirect_to greeting_cards_url, notice: 'Greeting card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greeting_card
      @greeting_card = GreetingCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def greeting_card_params
      params.require(:greeting_card).permit(:title, :message, :sender_name, :sender_email, :recipient_name, :recipient_email, :status)
    end
end
