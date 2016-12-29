class ClientsGrid

  include Datagrid

  scope do
    Client.all
  end

  filter(:id_number, :string) do |value|
    self.where('id_number iLike :number', number: "%#{value}%")
  end

  filter(:name, :string) do |value|
    self.where('name iLike :name', name: "%#{value}%")
  end

  filter(:phone, :string) do |value|
    self.where('phone iLike :phone', phone: "%#{value}%")
  end

  filter(:email, :string) do |value|
    self.where('email iLike :email', email: "%#{value}%")
  end

  column(:id_number)
  column(:name)
  column(:phone)
  column(:email)

  column(:control, header: '', html: true) do |object|
    render 'control', client: object
  end
end
