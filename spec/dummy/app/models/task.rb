class Task < ActiveRecord::Base
  has_many :tickets, as: :ticketfor, class_name: Ottrick::Ticket

  validates :subject, :message, presence: true

  def to_s
    "(#{id}) #{subject}"
  end
end
