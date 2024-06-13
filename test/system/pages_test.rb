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
      assert_selector 'div.alert-primary', text: 'This is an alert'
      assert_no_selector 'button.close'
    end
  end

  test 'visit the accordions themes page' do
    visit '/inspect/accordion/themes'

    within_frame find('iframe') do
      assert_selector 'div.accordion.accordion-flush'
    end
  end

  test 'visit the accordions playground page' do
    visit '/inspect/accordion/playground'

    within_frame find('iframe') do
      assert_selector 'div.accordion'
    end
  end

  test 'visit the badges themes page' do
    visit '/inspect/badge/themes'

    within_frame find('iframe') do
      assert_selector 'span.badge.text-bg-primary'
    end
  end

  test 'visit the badges playground page' do
    visit '/inspect/badge/playground'

    within_frame find('iframe') do
      assert_selector 'span.badge.text-bg-danger'
    end
  end

  test 'visit the cards themes page' do
    visit '/inspect/card/themes'

    within_frame find('iframe') do
      assert_selector 'div.card', class: 'renuo-card'
    end
  end

  test 'visit the utilities themes page' do
    visit '/inspect/utilities/themes'

    within_frame find('iframe') do
      assert_selector 'p', text: 'Resize the window to see the effect of different utility classes.'
    end
  end

  test 'visit the utilities playground page' do
    visit '/inspect/utilities/playground'

    within_frame find('iframe') do
      assert_selector 'button.position-sm-relative'
    end
  end

  test 'visit the disappearing alerts page' do
    visit '/inspect/disappearing_alert/themes'

    within_frame find('iframe') do
      assert_no_selector 'div.alert-primary'
      find('button.btn-primary').click
      assert_selector 'div.alert-info'
    end
  end
end
