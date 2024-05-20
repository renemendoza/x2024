class NumbersController < ApplicationController
  def index
    @title = "Numeros"
    @numbers = Number.all
  end
end
