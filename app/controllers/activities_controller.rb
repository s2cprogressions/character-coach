class ActivitiesController < ApplicationController
  def index
    render locals: { activities: Activity.activities }
  end
end
