require "rails_helper"

RSpec.feature "Playing through an activity", :js, type: :feature do
  scenario "User can choose from list of challenges" do
    load(Rails.root + "db/seeds.rb")

    visit activities_path

    Category.all.flat_map(&:challenges_titles).each do |challenge|
      expect(page).to have_content challenge
    end

    activity = Category.find_by(title: "School")
    challenge = activity.challenges_titles.sample

    within "#activity_#{activity.id}_challenge_#{activity.challenges_titles.index(challenge)}" do
      click_link "Start"
    end

    expect(page).to have_content "You're not alone."

    click_link "Next"

    expect(page).to have_content "I'm thinking that"

    activity.thinking_titles.each do |thought|
      expect(page).to have_link thought
    end

    thought = activity.thinking_titles.last

    click_link thought

    expect(page).to have_content "Because I'm thinking that #{thought}, I'm feeling"

    activity.feelings_titles.each do |feeling|
      expect(page).to have_link feeling
    end

    feeling = activity.feelings_titles.sample
    click_link feeling

    expect(page).to have_content "I'm concerned I might"

    activity.concerns_titles.each do |concern|
      expect(page).to have_link concern
    end

    concern = activity.concerns_titles.sample

    click_link concern

    expect(page).to have_content "Okay, thanks for letting us know what is going on."

    click_link "Next"

    puts page.current_path
    expect(page).to have_content challenge
    expect(page).to have_content thought
    expect(page).to have_content feeling
    expect(page).to have_content concern

    click_link "Next"

    expect(page).to have_content "Got it. Let us help you with that."

    click_link "Next"

    expect(page).to have_content "Instead of thinking that #{thought}, I will choose to believe that"

    activity.positive_thoughts.each do |positive_thought|
      expect(page).to have_link positive_thought
    end

    positive_thought = activity.positive_thoughts.sample

    click_link positive_thought

    expect(page).to have_content "Instead of feeling bad about feeling #{feeling}, I see that feeling #{feeling} is normal, and I can change the way I feel by taking positive actions."

    click_link "Next"

    expect(page).to have_content "Instead of planning to #{concern}, I have the ability to"

    activity.positive_behaviors.each do |positive_behavior|
      expect(page).to have_link positive_behavior
    end

    positive_behavior = activity.positive_behaviors.sample

    click_link positive_behavior

    expect(page).to have_content "I have the ability to #{positive_behavior}"
    expect(page).to have_content "I will choose to believe that #{positive_thought}"
    expect(page).to have_content "I see that feeling #{feeling} is normal, but I can change with positive action steps."

    click_link "Next"

    expect(page).to have_content "Awesome! You did it! Now do what you just planned to do, and keep on trying. Don't give up and in time you will succeed."

    click_link "Finish"
  end
end
