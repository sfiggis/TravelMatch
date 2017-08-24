class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :edit, :create, :update, :destroy]
  def show

  end

  def index

  end
end