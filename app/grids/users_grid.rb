class UsersGrid

  include Datagrid

  scope do
    User.all
  end

  filter(:email, :string)

  filter(:role, :enum, select: ['admin', 'support'])

  column(:email)
  column(:role)
  column(:control, header: '', html: true) do |object|
    render 'control', user: object
  end
end
