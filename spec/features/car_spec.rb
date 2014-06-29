require 'rails_helper'

feature '', %Q(
  As a car salesperson
  I want an expandable list of available cars

) do

# Acceptance Criteria

# Cars are listed on index with link to form for new cars
# Form validations prevent invalid submissions, and acknowledge success when properly submitted.
# Required fields are model name, year, color, mileage and manufacturer. Description is optional.
# Description field is optional.
# Model year cannot be older than 1920.

  scenario 'visit car index and see list of cars' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    attrs_car = {
      model_name: 'S 65 AMG',
      year: '2015',
      color: 'Black',
      mileage: 15,
      manufacturer_id: manufacturer.id
    }

    car = Car.create!(attrs_car)

    visit cars_path

    expect(page).to have_content manufacturer.name
    expect(page).to have_content car.model_name
  end

  scenario 'click on add a car link and form works, redirects' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    attrs_car = {
      model_name: 'S 65 AMG',
      year: '2015',
      color: 'Black',
      mileage: 15,
      manufacturer_id: manufacturer.id
    }

    car = Car.create!(attrs_car)

    visit cars_path

    click_on 'Add car to inventory.'
    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Year', with: 2015
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: 30
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content manufacturer.name
    expect(page).to have_content 'SLS AMG'
  end

  scenario 'car form, model name missing' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Year', with: 2015
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: 30
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Model name can\'t be blank'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'car form, year missing' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: 30
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Year can\'t be blank'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'car form, year too low' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Year', with: 1200
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: 30
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Year must be greater than or equal to 1920'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'car form, color missing' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Year', with: 2015
    fill_in 'Mileage', with: 30
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Color can\'t be blank'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'car form, mileage missing' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Year', with: 2015
    fill_in 'Color', with: 'Red'
    select(manufacturer.name, from: 'Manufacturer')
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Mileage can\'t be blank'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'car form, no manufacturer selected' do
    attrs = {
      name: 'Mercedes Benz',
      country: 'Germany'
    }

    manufacturer = Manufacturer.create!(attrs)

    visit new_car_path

    fill_in 'Model name', with: 'SLS AMG'
    fill_in 'Year', with: 2015
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: 30
    fill_in 'Description', with: 'Incredibly fast.'
    click_button 'Submit'
    expect(page).to have_content 'Manufacturer is not a number'
    expect(page).to have_content 'Something went wrong'
  end
end

