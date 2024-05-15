class CdrsController < ApplicationController
  def index
    @title = "Cdrs"
    @cdrs = Cdr.all
  end
end
