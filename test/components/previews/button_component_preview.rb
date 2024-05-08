class ButtonComponentPreview < Lookbook::Preview
  def playground
    render "buttons/playground"
  end

  def themes
    render ButtonComponent.new(text: "Launch spaceship", icon: "rocket")
  end
end
