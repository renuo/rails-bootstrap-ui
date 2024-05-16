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
end
