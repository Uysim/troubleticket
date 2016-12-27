class TroublesGrid

  include Datagrid

  scope do
    Trouble.all
  end
  column(:range)
  column(:state)
  column(:detail) do |object|
    object.detail.to_s.truncate(30);
  end
  column(:user_email)
  column(:client_name)

  column(:control, header: '', html: true) do |object|
    render 'control', trouble: object
  end
end
