Fabricator(:user) do
  email { FFaker::Internet.email }
  password { FFaker::Internet.password }

  after_save { |user| user.confirm }
end
