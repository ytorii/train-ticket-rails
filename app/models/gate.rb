# NOTE: Gate = 改札機のイメージ
class Gate < ApplicationRecord
  FARES = [150, 190, Float::INFINITY].freeze

  validates :name, presence: true, uniqueness: true
  validates :station_number, presence: true, uniqueness: true

  scope :order_by_station_number, -> { order(:station_number) }

  def exit?(ticket)
    #return false if self.id == ticket.entered_gate_id
    fare_pos =
      (ticket.entered_gate.station_number - self.station_number).abs - 1
    ticket.fare >= FARES[fare_pos]
  end
end
