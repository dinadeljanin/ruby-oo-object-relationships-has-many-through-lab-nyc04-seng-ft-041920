class Doctor
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    # look at same logic as songs
    Appointment.all.select { |appt| appt.doctor == self }
  end

  def new_appointment(patient, date)
    # last two tests didn't pass and had a date/patient switcharoo bc this was in the wrong place
    Appointment.new(date, patient, self)
  end

  def patients
    self.appointments.collect { |appt| appt.patient  }
  end
end
