class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:introduction, :auction, :event]

  def introduction
  end

  def auction
  end

  def event
  end

  def about
  end

  def help
  end

  def terms
  end

  def privacy_policy
  end

  def advertisement
  end
end
