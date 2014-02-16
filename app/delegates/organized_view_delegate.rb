class OrganizedViewDelegate

  def buttonPressedForOrganizedView(ov)
    ov.title.text = (ov.title.text == "Hello World!" ? "Goodbye!" : "Hello World!")
  end

end