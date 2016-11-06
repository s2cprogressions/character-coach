ActiveAdmin.register Category do
  permit_params :title,
                challenges_attributes: [:icon, :text, :description],
                thoughts_attributes: [:icon, :text, :description],
                feelings_attributes: [:icon, :text, :description],
                concerns_attributes: [:icon, :text, :description],
                positive_thoughts_attributes: [:icon, :text, :description],
                positive_behaviors_attributes: [:icon, :text, :description]

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
