class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def introduction
  end

  def auction
  end

  def event
  end
end
