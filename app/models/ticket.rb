class Ticket < ApplicationRecord
  belongs_to :entered_gate, class_name: 'Gate', foreign_key: 'entered_gate_id'
  belongs_to :exited_gate, class_name: 'Gate', foreign_key: 'exited_gate_id', required: false
  validates :fare, presence: true, inclusion: Gate::FARES
  validates :entered_gate_id, presence: true

  before_update :sufficent_fare?

  def sufficent_fare?
    unless exited_gate.exit?(self)
      errors[:base] << '降車駅 では降車できません。'
      throw(:abort) 
    end
  end
end
