# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'visit the buttons themes page' do
    visit '/inspect/button/themes'

    within_frame find('iframe') do
      assert_selector 'button', text: 'Primary'
      assert_selector 'button', text: 'Small button'
      assert_selector 'button.active', text: 'Active toggle button'
    end
  end

  test 'visit the buttons playground page' do
    visit '/inspect/button/playground'

    within_frame find('iframe') do
      assert_selector 'button.btn-primary', text: 'Placeholder'
      assert_no_selector 'button.btn-primary.active'
    end
  end

  test 'visit the alerts themes page' do
    visit '/inspect/alert/themes'

    within_frame find('iframe') do
      assert_selector 'div.alert-primary', text: 'A simple primary alert—check it out!'
    end
  end

  test 'visit the alerts playground page' do
    visit '/inspect/alert/playground'

    within_frame find('iframe') do
      assert_selector 'div.alert-primary', text: 'This is a alert'
      assert_no_selector 'button.close'
    end
  end
end
