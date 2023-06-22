ActiveAdmin.register Comment, as: 'PostComment' do
  menu priority: 5
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :body, :user_name, :post_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:body, :user_name, :post_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column

    column :body
    column :user_name
    column :post_id
    column :user_id

    actions
  end
end
