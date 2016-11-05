ActiveAdmin.register Category do
  permit_params :title, :challenges, :thinking, :feelings, :concerns, :positive_thoughts, :positive_behaviors

end
