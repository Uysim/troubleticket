class UsersGrid

  include Datagrid

  scope do
    User.all
  end

  filter(:email, :string) do |value|
    self.where('email iLike :email', email: "%#{value}%")
  end

  filter(:role, :enum, select: ['admin', 'support']) do |value, scope|
    scope.filter_by_role(value)
  end

  column(:email)
  column(:role)
  column(:control, header: '', html: true) do |object|
    render 'control', user: object
  end
end
