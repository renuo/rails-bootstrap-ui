require "test_helper"

class PagesTest < ActionView::TestCase
  test "visit the buttons themes page" do
    render template: "components/buttons/_themes", layout: "layouts/application"

    assert_select "button", text: "Primary"
    assert_select "button", text: "Small button"
    assert_select "button.active", text: "Active toggle button"
  end

  test "visit the buttons playground page" do
    render template: "components/buttons/_playground", layout: "layouts/application", locals: {title: "Primary", theme: "primary", state: "default", outline: false, block: false}

    assert_select "button.btn-primary", text: "Primary"
    assert_select "button.btn-primary.active", count: 0
  end

  test "visit the cards themes page" do
    render template: "components/cards/_themes", layout: "layouts/application"

    assert_select "div.card"
    assert_select "div.card-body"
    assert_select "ul.list-group"
  end

  test "visit the cards playground page" do
    render template: "components/cards/_playground", layout: "layouts/application", locals: {title: "Card Title", list_group: false, image: false, body: true, background_color: "default"}

    assert_select "div.card", text: /Card Title/
    assert_select "div.card-body", count: 2
  end

  test "visit the alerts themes page" do
    render template: "components/alerts/_themes", layout: "layouts/application"

    assert_select "div.alert"
    assert_select "div.alert-primary"
  end

  test "visit the alerts playground page" do
    render template: "components/alerts/_playground", layout: "layouts/application", locals: {title: "This is a alert", theme: "primary", link: false, dismissible: true, icon: false}

    assert_select "div.alert-primary", text: /This is a alert/
    assert_select "button.btn-close", count: 1
    assert_select "img.alert-icon", count: 0
  end
end
