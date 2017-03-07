require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
  describe '#toggle_favorite!' do 
    it "should switch favorite to false if it began as true" do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it "should switch favorite to true if it began as false" do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end
  describe 'overdue?' do 
    it "should return true if Time.now > deadline!" do
      task = Task.new(deadline: Time.now+ 10.hours)
      expect(task.overdue?).to eq(false)
    end

    it "should return false if Time.now < deadline" do
      task = Task.new(deadline: Time.now- 10.hours)
      expect(task.overdue?).to eq(true)
    end
  end
  describe 'increment_priority!' do 
    it "should return plus on if priority < 10" do
      task = Task.new(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end
    it "shouldn\'t' increment above 10"do
      task = Task.new(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
  end
  describe '#snooze_hour!' do 
    it 'should add an hour to the current deadline' do 
      deadline = Datatime.new(2017, 3, 7)
      task = Task.new(deadline:deadline)
      task.snooze_hour!
      expect(task,deadline).to eq(deadline+ 1.hour)
    end 
  end 
end
