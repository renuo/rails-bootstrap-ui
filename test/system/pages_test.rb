# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'visit the buttons themes page' do
    visit '/lookbook/inspect/button/themes'

    within_frame find('iframe') do
      assert_selector 'button', text: 'Primary'
      assert_selector 'button', text: 'Small button'
      assert_selector 'button.active', text: 'Active toggle button'
    end
  end

  test 'visit the buttons playground page' do
    visit '/lookbook/inspect/button/playground'

    within_frame find('iframe') do
      assert_selector 'button.btn-primary', text: 'Placeholder'
      assert_no_selector 'button.btn-primary.active'
    end
  end

  test 'visit the alerts themes page' do
    visit '/lookbook/inspect/alert/themes'

    within_frame find('iframe') do
      assert_selector 'div.alert-primary', text: 'A simple primary alert—check it out!'
    end
  end

  test 'visit the alerts playground page' do
    visit '/lookbook/inspect/alert/playground'

    within_frame find('iframe') do
      assert_selector 'div.alert-primary', text: 'This is an alert'
      assert_no_selector 'button.close'
    end
  end

  test 'visit the accordions themes page' do
    visit '/lookbook/inspect/accordion/themes'

    within_frame find('iframe') do
      assert_selector 'div.accordion.accordion-flush'
    end
  end

  test 'visit the accordions playground page' do
    visit '/lookbook/inspect/accordion/playground'

    within_frame find('iframe') do
      assert_selector 'div.accordion'
    end
  end

  test 'visit the badges themes page' do
    visit '/lookbook/inspect/badge/themes'

    within_frame find('iframe') do
      assert_selector 'span.badge.text-bg-primary'
    end
  end

  test 'visit the badges playground page' do
    visit '/lookbook/inspect/badge/playground'

    within_frame find('iframe') do
      assert_selector 'span.badge.text-bg-danger'
    end
  end

  test 'visit the breadcrumbs themes page' do
    visit '/lookbook/inspect/breadcrumbs/themes'

    within_frame find('iframe') do
      assert_selector '.breadcrumb'
    end
  end

  test 'visit the cards themes page' do
    visit '/lookbook/inspect/card/themes'

    within_frame find('iframe') do
      assert_selector 'div.card', class: 'renuo-card'
    end
  end

  test 'visit the position_utilities themes page' do
    visit '/lookbook/inspect/position_utilities/themes'

    within_frame find('iframe') do
      assert_selector 'p', text: 'Resize the window to see the effect of different utility classes.'
    end
  end

  test 'visit the position_utilities playground page' do
    visit '/lookbook/inspect/position_utilities/playground'

    within_frame find('iframe') do
      assert_selector 'button.position-sm-absolute'
    end
  end

  test 'visit the tab preview page' do
    visit '/lookbook/inspect/tab/nav_underline'

    within_frame find('iframe') do
      assert_selector 'nav.nav.nav-underline'
    end
  end

  test 'visit the disappearing alerts page' do
    visit '/lookbook/inspect/disappearing_alert/themes'

    within_frame find('iframe') do
      assert_no_selector 'div.alert-primary'
      click_button('Show live alert')
      assert_selector 'div.alert-info'
    end
  end

  test 'visit the kbd page' do
    visit '/lookbook/inspect/kbd/themes'

    within_frame find('iframe') do
      assert_selector 'kbd', text: 'CMD'
    end
  end

  test 'visit the confirm alert page' do
    visit '/lookbook/inspect/confirm_alert/themes'

    within_frame find('iframe') do
      assert_no_selector 'button', text: 'Confirm'
      click_button('Dangerous Action')
      assert_selector 'button', text: 'Confirm'
    end
  end
end
