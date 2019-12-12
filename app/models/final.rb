class Final < ApplicationRecord
  # Direct associations

  has_many   :enrollments,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
