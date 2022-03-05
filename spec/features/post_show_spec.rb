require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  describe 'User' do
    before(:each) do
      @photo = ' https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Fo_qCaRXIMyjygMR8Ux-7RC23aLnjstwCg&usqp=CAU'
      @user1 = User.create! name: 'tochi', photo: @photo, password: '123456789', email: 'yt@yahoo.com',
                            bio: 'test bio ', confirmed_at: Time.now

      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = Post.create!(author: @user1, title: 'test title 1', text: 'test text 1', likesCounter: '0',
                            commentsCounter: '0')

      @comment1 = Comment.create!(post: @post1, author: @user1, text: 'test comment 1')
      Comment.count_comments(@post1.id)

      @like1 = Like.create!(user_id: @user1.id, post_id: @post1.id)
      Like.count_likes(@post1.id)

      click_on 'tochi'
      click_on 'test title 1'
    end

    it 'shows posts title' do
      expect(page).to have_content('test title 1')
    end

    it 'can see who wrote the post.' do
      expect(page).to have_content('tochi')
    end

    it 'can see how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'can see how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end

    it 'can see some of the body for the post.' do
      expect(page).to have_content 'test text 1'
    end

    it 'can see the username of each commentor.' do
      expect(page).to have_content 'tochi'
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'test comment 1'
    end
  end
end
