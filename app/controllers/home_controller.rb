class HomeController < ApplicationController
  def index
  end

  def app_entry_point
    session[:mobile_app] = true
    redirect_to root_path
  end

  def challenges
  end

  def not_alone
    session[:category] = params[:category]
    session[:challenge] = params[:challenge].to_i
  end

  def thoughts
    render locals: { category: category }
  end

  def feelings
    session[:thought] = params[:thought].to_i
    render locals: { category: category, thought: thought }
  end

  def concerns
    session[:feeling] = params[:feeling].to_i
    render locals: { category: category }
  end

  def thanks
    session[:concern] = params[:concern].to_i
  end

  def summary
    render locals: {
      category: category,
      challenge: challenge,
      thought: thought,
      feeling: feeling,
      concern: concern,
    }
  end

  def let_me_help
  end

  def positive_thoughts
    render locals: { category: category, thought: thought }
  end

  def positive_emotions
    session[:positive_thought] = params[:positive_thought].to_i
    render locals: { category: category, feeling: feeling }
  end

  def positive_behaviors
    render locals: { category: category, concern: concern }
  end

  def success_plan
    session[:positive_behavior] = params[:positive_behavior].to_i
    render locals: {
      category: category,
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

  def category
    Category.find(session[:category])
  end

  def challenge
    category.challenges.find_by(id: session[:challenge])
  end

  def thought
    category.thoughts.find_by(id: session[:thought])
  end

  def feeling
    category.feelings.find_by(id: session[:feeling])
  end

  def concern
    category.concerns.find_by(id: session[:concern])
  end

  def positive_thought
    category.positive_thoughts.find_by(id: session[:positive_thought])
  end

  def positive_behavior
    category.positive_behaviors.find_by(id: session[:positive_behavior])
  end
end
