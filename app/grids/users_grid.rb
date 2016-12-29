class UsersGrid

  include Datagrid

  scope do
    User.all
  end
  column(:email)
  column(:role)
  column(:control, header: '', html: true) do |object|
    render 'control', user: object
  end
end
