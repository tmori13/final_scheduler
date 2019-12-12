class EnrollmentsController < ApplicationController
  before_action :current_user_must_be_enrollment_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_enrollment_user
    enrollment = Enrollment.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == enrollment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Enrollment.ransack(params[:q])
    @enrollments = @q.result(:distinct => true).includes(:final, :user).page(params[:page]).per(10)

    render("enrollment_templates/index.html.erb")
  end

  def show
    @enrollment = Enrollment.find(params.fetch("id_to_display"))

    render("enrollment_templates/show.html.erb")
  end

  def new_form
    @enrollment = Enrollment.new

    render("enrollment_templates/new_form.html.erb")
  end

  def create_row
    @enrollment = Enrollment.new

    @enrollment.user_id = params.fetch("user_id")
    @enrollment.final_id = params.fetch("final_id")

    if @enrollment.valid?
      @enrollment.save

      redirect_back(:fallback_location => "/enrollments", :notice => "Enrollment created successfully.")
    else
      render("enrollment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_final
    @enrollment = Enrollment.new

    @enrollment.user_id = params.fetch("user_id")
    @enrollment.final_id = params.fetch("final_id")

    if @enrollment.valid?
      @enrollment.save

      redirect_to("/finals/#{@enrollment.final_id}", notice: "Enrollment created successfully.")
    else
      render("enrollment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @enrollment = Enrollment.find(params.fetch("prefill_with_id"))

    render("enrollment_templates/edit_form.html.erb")
  end

  def update_row
    @enrollment = Enrollment.find(params.fetch("id_to_modify"))

    
    @enrollment.final_id = params.fetch("final_id")

    if @enrollment.valid?
      @enrollment.save

      redirect_to("/enrollments/#{@enrollment.id}", :notice => "Enrollment updated successfully.")
    else
      render("enrollment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_final
    @enrollment = Enrollment.find(params.fetch("id_to_remove"))

    @enrollment.destroy

    redirect_to("/finals/#{@enrollment.final_id}", notice: "Enrollment deleted successfully.")
  end

  def destroy_row_from_user
    @enrollment = Enrollment.find(params.fetch("id_to_remove"))

    @enrollment.destroy

    redirect_to("/users/#{@enrollment.user_id}", notice: "Enrollment deleted successfully.")
  end

  def destroy_row
    @enrollment = Enrollment.find(params.fetch("id_to_remove"))

    @enrollment.destroy

    redirect_to("/enrollments", :notice => "Enrollment deleted successfully.")
  end
end
