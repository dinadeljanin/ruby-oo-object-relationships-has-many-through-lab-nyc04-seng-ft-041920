class Patient
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
    Appointment.all.select { |appt| appt.patient == self }
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def doctors
    self.appointments.collect { |appt| appt.doctor }
  end
end
