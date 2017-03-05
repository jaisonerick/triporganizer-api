class PlaceInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:span) do
      template.concat @builder.input(:"#{attribute_name}", label: false, input_html: input_html_options)
      template.concat template.content_tag(:div, '', class: 'places-map')
    end
  end

  def input_html_options
    super.merge({ class: 'places-autocomplete' })
  end
end
