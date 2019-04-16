Fabricator(:user) do
  email { FFaker::Internet.email }
  password { FFaker::Internet.password }

  after_save { |user| user.confirm; }
end

# Fabricator(:admin_user, from: :user) do
#   after_save { |user| user.add_role :admin }
# end