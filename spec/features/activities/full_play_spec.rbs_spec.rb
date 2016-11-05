require "rails_helper"

RSpec.feature "Playing through an activity", :js, type: :feature do
  scenario "User can choose from list of challenges" do
    visit activities_path

    Activity.activities.flat_map(&:challenges).each do |challenge|
      expect(page).to have_content challenge
    end
  end
end
