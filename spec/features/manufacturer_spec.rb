require 'rails_helper'

feature '', %Q(
  As a car salesperson
  I want an expandable list of manufacturers

) do

  # Acceptance Criteria

  # Manufacturers are listed on index with link to form for new cars
  # Form validations prevent invalid submissions,
  #   and acknowledge success when properly submitted.
  # Required fields are name and country.

  scenario 'visit car index and see list of manufacturers' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit manufacturers_path

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
  end

  scenario 'click on add a manufacturer link and form works' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit manufacturers_path

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    click_on 'Add manufacturer.'
    fill_in 'Name', with: 'Aston Martin'
    fill_in 'Country', with: 'Great Britain'
    click_button 'Submit'
    expect(page).to have_content 'Aston Martin'
    expect(page).to have_content 'Great Britain'
    expect(page).to have_content 'You have successfully added a manufacturer'
  end

  scenario 'manufacturer form, name missing' do

    visit new_manufacturer_path

    fill_in 'Country', with: 'Great Britain'
    click_button 'Submit'
    expect(page).to have_content 'Something went wrong'
    expect(page).to have_content 'Name can\'t be blank'
  end

  scenario 'manufacturer form, country missing' do

    visit new_manufacturer_path

    fill_in 'Name', with: 'Aston Martin'
    click_button 'Submit'
    expect(page).to have_content 'Something went wrong'
    expect(page).to have_content 'Country can\'t be blank'
  end

  scenario 'manufacturer appears in car form dropdown' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    expect(page).to have_content 'Mercedes Benz'
  end
end
