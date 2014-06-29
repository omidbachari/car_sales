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

  end

  scenario 'click on add a car link and form works, redirects' do

  end

  scenario 'car form, model name missing' do

  end

  scenario 'car form, year missing' do

  end

  scenario 'car form, year too low' do

  end

  scenario 'car form, color missing' do

  end

  scenario 'car form, mileage missing' do

  end

  scenario 'car form, no manufacturer selected' do

  end
end

