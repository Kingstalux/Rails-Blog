require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be greater than or equal to zero' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be greater than or equal to zero' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'return the recent comments for a post' do
    expect(Post.recent_comments(subject.id).count).to eql 0
  end

  it 'return all the comments for a post' do
    expect(Post.all_comments(subject.id).count).to eql 0
  end
end
