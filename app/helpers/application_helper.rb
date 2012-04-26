module ApplicationHelper

  def menu_link(name, path, klass)
    content_tag :li, link_to(name, path),
      class: klass == controller.menu_klass ? 'active' : ''
  end

end
