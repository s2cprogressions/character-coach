ActiveAdmin.register PageContent do
  permit_params :key, :text, :type

  sidebar :required do
    ul do
      PageContent.missing_content.each do |key, type|
        li do
          link_to("Add Content for #{key.humanize}", new_admin_page_content_path(page_content: { key: key, type: type.to_s }))
        end
      end
    end
  end

  form do |f|
    f.inputs f.object.key&.humanize || "New Content" do
      f.input :type, as: (f.object.required? ? :hidden : :select), collection: %i(string text)
      f.input :key, as: (f.object.required? ? :hidden : :string)
      f.input :text, as: f.object.type
    end
    f.actions
  end
end
