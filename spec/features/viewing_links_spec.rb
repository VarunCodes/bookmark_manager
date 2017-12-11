feature 'Bookmark links' do
  scenario 'displays list of links' do
    expect(page).to have_content("www.youtube.com")
  end
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'www.youtube.com', title: "Youtube")
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Youtube')
    end
  end
end
