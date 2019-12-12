class Enrollment < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :final

  # Indirect associations

  # Validations

end
