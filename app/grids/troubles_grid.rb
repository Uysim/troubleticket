class TroublesGrid
  include Datagrid

  scope do
    Trouble.all
  end

  filter(:aasm_state, :enum, select: Trouble::aasm.states)

  filter(:detail) do |value|
    self.where('detail iLike :detail', detail: "%#{value}%")
  end

  filter(:user_email, header: 'Worker Email') do |value|
    self.joins(:user).merge(User.with_email(value))
  end

  filter(:client_name, header: 'Client Name') do |value|
    self.joins(:client).merge(Client.name_like(value))
  end

  filter(:client_id_number) do |value|
    self.joins(:client).merge(Client.with_id_number(value))
  end

  filter(:client_phone) do |value|
    self.joins(:client).merge(Client.with_phone(value))
  end

  filter(:occupancy)

  filter(:client_email) do |value|
    self.joins(:client).merge(Client.with_email(value))
  end

  filter(:range, :enum, select: Trouble::RANGE)

  filter(:occur_date, :datetime, :range => true)

  column(:client_name, html: true) do |object|
    link_to object.client_name, object.client
  end
  column(:client_id_number, html: true) do |object|
    link_to object.client.id_number, object.client
  end
  column(:range)
  column(:aasm_state, header: 'State')
  column(:detail) do |object|
    object.detail.to_s.truncate(30);
  end
  column(:occur_date, header: 'Occur Time')
  column(:user_email, header: 'Worker')
  column(:occupancy)

  column(:control, header: '', html: true) do |object|
    render 'control', trouble: object
  end
end
