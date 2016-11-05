class HomeController < ApplicationController
  def index
  end

  def challenges
  end

  def not_alone
    session[:activity] = params[:activity]
    session[:challenge] = params[:challenge].to_i
  end

  def thoughts
    render locals: { activity: activity }
  end

  def feelings
    session[:thought] = params[:thought].to_i
    render locals: { activity: activity, thought: thought }
  end

  def concerns
    session[:feeling] = params[:feeling].to_i
    render locals: { activity: activity }
  end

  def thanks
    session[:concern] = params[:concern].to_i
  end

  def summary
    render locals: {
      activity: activity,
      challenge: challenge,
      thought: thought,
      feeling: feeling,
      concern: concern,
    }
  end

  def let_me_help
  end

  def positive_thoughts
    render locals: { activity: activity, thought: thought }
  end

  def positive_emotions
    session[:positive_thought] = params[:positive_thought].to_i
    render locals: { activity: activity, feeling: feeling }
  end

  def positive_behaviors
    render locals: { activity: activity, concern: concern }
  end

  def success_plan
    session[:positive_behavior] = params[:positive_behavior].to_i
    render locals: {
      activity: activity,
      positive_thought: positive_thought,
      feeling: feeling,
      positive_behavior: positive_behavior,
    }
  end

  def complete
  end

  def about
  end

  private

  def activity
    Activity.activity(session[:activity])
  end

  def challenge
    activity.challenges[session[:challenge]]
  end

  def thought
    activity.thoughts[session[:thought]]
  end

  def feeling
    activity.feelings[session[:feeling]]
  end

  def concern
    activity.concerns[session[:concern]]
  end

  def positive_thought
    activity.positive_thoughts[session[:positive_thought]]
  end

  def positive_behavior
    activity.positive_behaviors[session[:positive_behavior]]
  end
end
