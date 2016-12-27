class ClientsGrid

  include Datagrid

  scope do
    Client.all
  end
  column(:id_number)
  column(:name)
  column(:phone)
  column(:email)

  column(:control, header: '', html: true) do |object|
    render 'control', client: object
  end
end
