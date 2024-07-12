# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  def visit_preview_page(page) = visit("/lookbook/preview/#{page}")

  test 'visit the buttons themes page' do
    visit_preview_page('button/themes')

    assert_selector 'button', text: 'Primary'
    assert_selector 'button', text: 'Small button'
    assert_selector 'button.active', text: 'Active toggle button'
  end

  test 'visit the buttons playground page' do
    visit_preview_page('button/playground')

    assert_selector 'button.btn-primary', text: 'Placeholder'
    assert_no_selector 'button.btn-primary.active'
  end

  test 'visit the alerts themes page' do
    visit_preview_page('alert/themes')

    assert_selector 'div.alert-primary', text: 'A simple primary alert—check it out!'
  end

  test 'visit the alerts playground page' do
    visit_preview_page('alert/playground')

    assert_selector 'div.alert-primary', text: 'This is an alert'
    assert_no_selector 'button.close'
  end

  test 'visit the accordions themes page' do
    visit_preview_page('accordion/themes')

    assert_selector 'div.accordion.accordion-flush'
  end

  test 'visit the accordions playground page' do
    visit_preview_page('accordion/playground')

    assert_selector 'div.accordion'
  end

  test 'visit the badges themes page' do
    visit_preview_page('badge/themes')

    assert_selector 'span.badge.text-bg-primary'
  end

  test 'visit the badges playground page' do
    visit_preview_page('badge/playground')

    assert_selector 'span.badge.text-bg-danger'
  end

  test 'visit the breadcrumbs themes page' do
    visit_preview_page('breadcrumbs/themes')

    assert_selector '.breadcrumb'
  end

  test 'visit the cards themes page' do
    visit_preview_page('card/themes')

    assert_selector 'div.card', class: 'renuo-card'
  end

  test 'visit the position_utilities themes page' do
    visit_preview_page('position_utilities/themes')

    assert_selector 'p', text: 'Resize the window to see the effect of different utility classes.'
  end

  test 'visit the position_utilities playground page' do
    visit_preview_page('position_utilities/playground')

    assert_selector 'button.position-sm-absolute'
  end

  test 'visit the tab preview page' do
    visit_preview_page('tab/nav_underline')

    assert_selector 'nav.nav.nav-underline'
  end

  test 'visit the disappearing alerts page' do
    visit_preview_page('disappearing_alert/themes')

    assert_no_selector 'div.alert-primary'
    click_button('Show live alert')
    assert_selector 'div.alert-info'
  end

  test 'visit the avatars page' do
    visit_preview_page('avatar/themes')

    assert_selector 'div.avatar'
  end

  test 'visit the kbd page' do
    visit_preview_page('kbd/themes')

    assert_selector 'kbd', text: 'CMD'
  end

  test 'visit the tooltip page' do
    visit_preview_page('tooltip/themes')

    assert_selector 'button', text: 'Tooltip on top'
  end

  test 'visit the confirm alert page' do
    visit_preview_page('confirm_alert/themes')

    assert_no_selector 'button', text: 'Confirm'
    click_button('Dangerous Action')
    assert_selector 'button', text: 'Confirm'
  end
end
