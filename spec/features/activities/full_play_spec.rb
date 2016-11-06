require "rails_helper"

RSpec.feature "Playing through an activity", :js, type: :feature do
  scenario "User can choose from list of challenges" do
    load(Rails.root + "db/seeds.rb")

    visit challenges_activity_path

    CategoryOption.challenges.each do |challenge|
      expect(page).to have_content challenge.text
    end

    activity = Category.find_by(title: "School")
    challenge = activity.challenges.sample

    within "#activity_#{activity.id}_challenge_#{challenge.id}" do
      click_link "Start"
    end

    expect(page).to have_content "You're not alone"

    click_link "Find out how"

    expect(page).to have_content "I'm thinking that"

    activity.thoughts.each do |thought|
      expect(page).to have_link thought.text
    end

    thought = activity.thoughts.last

    click_link thought.text

    expect(page).to have_content "Because I'm thinking that #{thought.text}, I'm feeling"

    activity.feelings.each do |feeling|
      expect(page).to have_link feeling.text
    end

    feeling = activity.feelings.sample
    click_link feeling.text

    expect(page).to have_content "I'm concerned I might"

    activity.concerns.each do |concern|
      expect(page).to have_link concern.text
    end

    concern = activity.concerns.sample

    click_link concern.text

    expect(page).to have_content "Okay, thanks for letting us know what is going on."

    click_link "Next"

    expect(page).to have_content challenge.text
    expect(page).to have_content thought.text
    expect(page).to have_content feeling.text
    expect(page).to have_content concern.text

    click_link "Next"

    expect(page).to have_content "Got it. Let us help you with that."

    click_link "Next"

    expect(page).to have_content "Instead of thinking that #{thought.text}, I will choose to believe that"

    activity.positive_thoughts.each do |positive_thought|
      expect(page).to have_link positive_thought.text
    end

    positive_thought = activity.positive_thoughts.sample

    click_link positive_thought.text

    expect(page).to have_content "Instead of feeling bad about feeling #{feeling.text}, I see that feeling #{feeling.text} is normal, and I can change the way I feel by taking positive actions."

    click_link "Next"

    expect(page).to have_content "Instead of planning to #{concern.text}, I have the ability to"

    activity.positive_behaviors.each do |positive_behavior|
      expect(page).to have_link positive_behavior.text
    end

    positive_behavior = activity.positive_behaviors.sample

    click_link positive_behavior.text

    expect(page).to have_content "I have the ability to #{positive_behavior.text}"
    expect(page).to have_content "I will choose to believe that #{positive_thought.text}"
    expect(page).to have_content "I see that feeling #{feeling.text} is normal, but I can change with positive action steps."

    click_link "Next"

    expect(page).to have_content "Awesome! You did it! Now do what you just planned to do, and keep on trying. Don't give up and in time you will succeed."

    click_link "Finish"
  end
end
