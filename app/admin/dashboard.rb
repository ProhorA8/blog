# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Info' do
          para 'Welcome to ActiveAdmin.'
        end
      end

      column do
        panel 'Users' do
          ul do
            li "count: #{User.count}"
            li br
            User.all.map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel 'Posts' do
          ul do
            li "count: #{Post.count}"
            li br
            Post.all.map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end

      column do
        panel 'Comments count' do
          ul do
            Comment.count
          end
        end
      end
    end
  end # content
end
