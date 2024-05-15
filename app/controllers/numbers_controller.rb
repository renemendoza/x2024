class NumbersController < ApplicationController
  def index
    @title = "Numbers"
    @numbers = Number.all
  end
end
