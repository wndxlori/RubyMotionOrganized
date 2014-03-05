class OrganizedController < UIViewController
  def init
    super.tap do |oc|
      oc.title = "Organized"
    end
  end

  def loadView
    self.view = OrganizedStylesheet.organized_view
    self.view.delegate = self.organized_view_delegate
  end

  def organized_view_delegate
    @organized_view_delegate ||= OrganizedViewDelegate.new
  end
end
