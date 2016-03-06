class FeedsController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all.includes(:owner, :trackable).order(created_at: :desc)
  end
end
