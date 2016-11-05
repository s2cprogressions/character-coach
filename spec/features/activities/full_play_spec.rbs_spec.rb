require "rails_helper"

RSpec.feature "Playing through an activity", :js, type: :feature do
  scenario "User can choose from list of challenges" do
    visit activities_path

    Activity.activities.flat_map(&:challenges).each do |challenge|
      expect(page).to have_content challenge
    end

    activity = Activity.activity(:school)

    within "#activity_#{activity.id}_challenge_0" do
      click_link "Start"
    end
  end
end
