class TroublesGrid
  include Datagrid

  scope do
    Trouble.all
  end

  filter(:range, :string)

  filter(:aasm_state, :enum, select: Trouble::aasm.states)

  filter(:detail) do |value|
    self.where('detail iLike :detail', detail: "%#{value}%")
  end

  filter(:user_email, header: 'User Email') do |value|
    self.joins(:user).merge(User.email_like(value))
  end

  filter(:client_name, header: 'Client Name') do |value|
    self.joins(:client).merge(Client.name_like(value))
  end

  filter(:client_id_number) do |value|
    self.joins(:client).merge(Client.id_number_like(value))
  end

  filter(:client_phone) do |value|
    self.joins(:client).merge(Client.phone_like(value))
  end

  filter(:client_email) do |value|
    self.joins(:client).merge(Client.email_like(value))
  end

  column(:range)
  column(:aasm_state, header: 'State')

  column(:detail) do |object|
    object.detail.to_s.truncate(30);
  end
  column(:user_email)
  column(:client_name)
  column(:occupancy)
  column(:occur_date)

  column(:control, header: '', html: true) do |object|
    render 'control', trouble: object
  end
end
