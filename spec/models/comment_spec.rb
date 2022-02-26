require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    @user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', postsCounter: 0)
    Post.new(title: 'To Be', text: 'The big question is?', commentsCounter: 1, author: @user, id: 3)
  end

  before { subject.save }

  it 'should return number of comments' do
    subject.comments.new(author: @user, text: 'Well said.')
    expect(subject.commentsCounter).to eql 1
  end
end
