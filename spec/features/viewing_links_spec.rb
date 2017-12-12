feature 'Bookmark links:' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'www.tumblr.com', title: "Tumblr")
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Tumblr')
    end
  end
end
