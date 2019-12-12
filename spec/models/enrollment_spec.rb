require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should belong_to(:final) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
