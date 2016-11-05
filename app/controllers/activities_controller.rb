class ActivitiesController < ApplicationController
  def index
    render locals: { activities: Category.all }
  end
end
