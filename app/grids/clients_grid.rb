class ClientsGrid

  include Datagrid

  scope do
    Client.all
  end

  filter(:id_number, :string)

  filter(:name, :string) do |value|
    self.name_like(value)
  end

  filter(:phone, :string)

  filter(:email, :string)

  column(:id_number)
  column(:name)
  column(:phone)
  column(:email)

  column(:control, header: '', html: true) do |object|
    render 'control', client: object
  end
end
