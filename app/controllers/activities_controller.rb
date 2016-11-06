# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action do
    headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    headers["Pragma"] = "no-cache"
    headers["Expires"] = "0"
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
  end

  def challenges
    render locals: { activities: Category.all }
  end

  def not_alone
    update_activity(params.permit(:category, :challenge))
  end

  def thoughts
    render locals: { category: activity.category }
  end

  def feelings
    update_activity(params.permit(:thought))
    render locals: { category: activity.category, thought: activity.thought }
  end

  def concerns
    update_activity(params.permit(:feeling))
    render locals: { category: activity.category }
  end

  def thanks
    update_activity(params.permit(:concern))
  end

  def summary
    render locals: {
      category: activity.category,
      challenge: activity.challenge,
      thought: activity.thought,
      feeling: activity.feeling,
      concern: activity.concern,
    }
  end

  def let_me_help
  end

  def positive_thoughts
    render locals: { category: activity.category, thought: activity.thought }
  end

  def positive_emotions
    update_activity(params.permit(:positive_thought))
    render locals: { category: activity.category, feeling: activity.feeling }
  end

  def positive_behaviors
    render locals: { category: activity.category, concern: activity.concern }
  end

  def success_plan
    update_activity(params.permit(:positive_behavior))
    render locals: {
      category: activity.category,
      positive_thought: activity.positive_thought,
      feeling: activity.feeling,
      positive_behavior: activity.positive_behavior,
    }
  end

  def complete
    update_activity(completed: true)
  end

  private

  def update_activity(attrs)
    activity.assign_attributes(attrs.transform_keys { |k| k.to_s.presence_in(%w(completed id)) || "#{k}_id" })
    session[:current_activity] = activity
  end

  def activity
    @activity ||= CurrentActivity.new(session[:current_activity].presence || { id: session[:current_activity]})
  end

  def not_found
    redirect_to root_path
  end
end
