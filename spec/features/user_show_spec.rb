require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  describe 'User' do
    before(:each) do
      @photo = ' https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Fo_qCaRXIMyjygMR8Ux-7RC23aLnjstwCg&usqp=CAU'
      @user1 = User.create! name: 'tochi', photo: @photo, password: '123456789', email: 'yt@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = Post.create!(author: @user1, title: 'test title 1', text: 'test text 1', likesCounter: '0', commentsCounter: '0')
      @post2 = Post.create!(author: @user1, title: 'test title 2', text: 'test text 2', likesCounter: '0', commentsCounter: '0')
      @post3 = Post.create!(author: @user1, title: 'test title 3', text: 'test text 3', likesCounter: '0', commentsCounter: '0')
      click_on 'tochi'
    end

    it 'shows the username of the user' do
      expect(page).to have_content('tochi')
    end

    it 'shows the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows number of posts for the user' do
      expect(page).to have_content('Number of posts:')
    end

    it 'shows the bio for the user' do
      expect(page).to have_content('test bio')
      visit user_session_path
    end

    it 'Should see the first 3 posts for the user.' do
      expect(page).to have_content 'test title 1'
      expect(page).to have_content 'test title 2'
      expect(page).to have_content 'test title 3'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_button('See all posts')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s show page.' do
      click_link "test title 1"
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_button 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end