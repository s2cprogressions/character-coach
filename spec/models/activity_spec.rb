require "rails_helper"

RSpec.describe Activity, type: :model do
  describe ".activities" do
    subject(:activities) { Activity.activities }
    it "returns an array of Activity instances" do
      expect(activities).to all(be_a(Activity))
    end

    it "sets the titles" do
      expect(activities.map(&:title)).to contain_exactly "School", "Trouble", "Attitude"
    end

    it "sets the ids" do
      expect(activities.map(&:id)).to contain_exactly "school", "trouble", "attitude"
    end

    it "sets the feelings" do
      global_feelings = %w(Angry Worried Anxious Nervous Sad Scared Mad Okay Content)
      expect(activities.map(&:feelings)).to contain_exactly global_feelings, global_feelings, global_feelings
    end

    it "merges default elements with existing elements" do
      expect(Activity.activity(:school).concerns).to eq [
        "I'll fail a class",
        "I'll cheat on a test",
        "I won't graduate",
        "I'll skip school",
        "I'll do a bad job",
      ]
    end
  end

  describe ".activity" do
    it "returns an Activity" do
      school = Activity.activity(:school)
      expect(school).to be_a Activity
    end

    it "returns the activity for the given id" do
      school = Activity.activity(:school)
      expect(school.id).to eq "school"
    end
  end
end
