ActiveAdmin.register Category do
  permit_params :title,
                challenges_attributes: [:id, :icon, :text, :description, :_destroy],
                thoughts_attributes: [:id, :icon, :text, :description, :_destroy],
                feelings_attributes: [:id, :icon, :text, :description, :_destroy],
                concerns_attributes: [:id, :icon, :text, :description, :_destroy],
                positive_thoughts_attributes: [:id, :icon, :text, :description, :_destroy],
                positive_behaviors_attributes: [:id, :icon, :text, :description, :_destroy]

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

  show do
    attributes_table do
      row :id
      row :title
      row :created_at
      row :updated_at
    end

    CategoryOption::TYPES.each do |option_type|
      panel option_type.titleize.pluralize do
        table_for category.send(option_type.pluralize) do
          column :text
          column :description
          column :icon
        end
      end
    end

    active_admin_comments
  end
end
