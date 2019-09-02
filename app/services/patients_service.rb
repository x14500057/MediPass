# app/services/tweet_creator.rb
class CreatePatientProfile < ApplicationService
  attr_reader :patient
  
  def initialize(patient)
    @patient = patient
  end

  def call
    return nil unless @patient.save
    return true
  end
    
  end
end