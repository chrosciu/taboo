class CardsController < ApplicationController
  def show
    @card = Card.offset(rand(Card.count)).first!
  end
end