class CardComponentPreview < Lookbook:: Preview
  # Interactive playground for experimenting with different card styles and states.
  #@param title "Card Title"
  #@param list_group select { choices: [true, false] } "List group"
  #@param image select { choices: [true, false] } "Image"
  #@param body select { choices: [true, false] } "Body"
  #@param background_color select { choices: [default, primary, secondary, success, danger, warning, info, light, dark] } "Background color"
  def playground(title: "Card Title", list_group: false, image: false, body: false, background_color: "default")
    render "components/cards/playground", title: title, list_group: list_group, image: image, body: body, background_color: background_color
  end

  def themes
    render "components/cards/themes"
  end

end
