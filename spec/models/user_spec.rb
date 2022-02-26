require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be greater than or equal to zero' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'return the three latest posts for a user' do
    expect(User.recent_post(subject.id).count).to eql 0
  end

  it 'return all the posts for a user' do
    expect(User.all_post(subject.id).count).to eql 0
  end
end
