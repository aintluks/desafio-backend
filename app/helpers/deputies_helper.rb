module DeputiesHelper
  def info_message
    t('.info_message', 
      href: link_to(t('.link_to'),
      "https://dadosabertos.camara.leg.br/swagger/api.html#staticfile", target: "_blank")).html_safe
  end
end