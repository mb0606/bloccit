class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def html_container(html)
    tag :div, tag(:ul, html), container_attributes
  end
end