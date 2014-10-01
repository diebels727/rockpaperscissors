class ThrowsController < ApplicationController
  def new
    @signs = Sign.all
  end

  def create
    user_sign = Sign.new params[:sign]
    computer_sign = Sign.random

    if user_sign.ties?(computer_sign)
      flash[:message] = 'You Tied!'
      render(status: :created) && return
    end

    if user_sign.beats?(computer_sign)
      flash[:message] = 'You Win!'
      render(status: :created) && return
    end

    flash[:message] = 'You Lose!'
    render status: :success
  end

end