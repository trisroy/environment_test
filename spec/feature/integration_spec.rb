# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'tris'
    fill_in 'Price', with: 1
    fill_in 'Published date', with: Date.new(2021, 10, 01)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('tris')
    expect(page).to have_content(1)
    expect(page).to have_content('2021-10-01')
  end

  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter 2'
    fill_in 'Author', with: 'tris 2'
    fill_in 'Price', with: 10
    fill_in 'Published date', with: Date.new(2001, 10, 01)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter 2')
    expect(page).to have_content('tris 2')
    expect(page).to have_content(10)
    expect(page).to have_content('2001-10-01')
  end

  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter 3!'
    fill_in 'Author', with: 'tri!s 3'
    fill_in 'Price', with: 100
    fill_in 'Published date', with: Date.new(2021, 10, 9)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter 3!')
    expect(page).to have_content('tri!s 3')
    expect(page).to have_content(100)
    expect(page).to have_content('2021-10-09')
  end

  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: '4 .harry potter'
    fill_in 'Author', with: 'tris /'
    fill_in 'Price', with: 18042
    fill_in 'Published date', with: Date.new(2001, 12, 10)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('4 .harry potter')
    expect(page).to have_content('tris /')
    expect(page).to have_content(18042)
    expect(page).to have_content('2001-12-10')
  end
end
