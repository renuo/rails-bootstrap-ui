class AlertComponentPreview < Lookbook::Preview
  # Interactive playground for experimenting with different alert styles and states.
  # @param title "Alert title"
  # @param theme select { choices: [primary, secondary, danger, warning, info, light, dark, link] } "Default bootstrap themes"
  # @param link select { choices: [true, false] } "With link"
  # @param dismissible select { choices: [true, false] } "Dismissible alert"
  # @param icon select { choices: [true, false] } "With icon"

  def playground(title: "This is a alert", theme: "primary", link: false, dismissible: false, icon: false)
    render "components/alerts/playground", title: title, theme: theme, link: link, dismissible: dismissible, icon: icon
  end

  def themes
    render "components/alerts/themes"
  end
end
