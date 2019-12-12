require 'rails_helper'

RSpec.describe Final, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:enrollments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
