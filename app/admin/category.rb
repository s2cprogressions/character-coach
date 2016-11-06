ActiveAdmin.register Category do
  permit_params :title,
                challenges_attributes: [:id, :icon, :text, :description, :_delete],
                thoughts_attributes: [:id, :icon, :text, :description, :_delete],
                feelings_attributes: [:id, :icon, :text, :description, :_delete],
                concerns_attributes: [:id, :icon, :text, :description, :_delete],
                positive_thoughts_attributes: [:id, :icon, :text, :description, :_delete],
                positive_behaviors_attributes: [:id, :icon, :text, :description, :_delete]

  form do |f|
    f.inputs "Details" do
      f.input :title
    end

    CategoryOption::TYPES.each do |option_type|
      f.inputs do
        f.has_many option_type.pluralize,
                   heading: option_type.titleize.pluralize,
                   allow_destroy: true,
                   new_record: true do |a|
          a.input :icon
          a.input :text
          a.input :description
        end
      end
    end
    f.actions
  end
end
