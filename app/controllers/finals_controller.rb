class FinalsController < ApplicationController
  def index
    @q = Final.ransack(params[:q])
    @finals = @q.result(:distinct => true).includes(:enrollments).page(params[:page]).per(10)

    render("final_templates/index.html.erb")
  end

  def show
    @enrollment = Enrollment.new
    @final = Final.find(params.fetch("id_to_display"))

    render("final_templates/show.html.erb")
  end

  def new_form
    @final = Final.new

    render("final_templates/new_form.html.erb")
  end

  def create_row
    @final = Final.new

    @final.course_identifier = params.fetch("course_identifier")
    @final.section = params.fetch("section")
    @final.course_name = params.fetch("course_name")
    @final.instructor = params.fetch("instructor")
    @final.start_time = params.fetch("start_time")
    @final.end_time = params.fetch("end_time")
    @final.day = params.fetch("day")
    @final.date = params.fetch("date")
    @final.room = params.fetch("room")

    if @final.valid?
      @final.save

      redirect_back(:fallback_location => "/finals", :notice => "Final created successfully.")
    else
      render("final_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @final = Final.find(params.fetch("prefill_with_id"))

    render("final_templates/edit_form.html.erb")
  end

  def update_row
    @final = Final.find(params.fetch("id_to_modify"))

    @final.course_identifier = params.fetch("course_identifier")
    @final.section = params.fetch("section")
    @final.course_name = params.fetch("course_name")
    @final.instructor = params.fetch("instructor")
    @final.start_time = params.fetch("start_time")
    @final.end_time = params.fetch("end_time")
    @final.day = params.fetch("day")
    @final.date = params.fetch("date")
    @final.room = params.fetch("room")

    if @final.valid?
      @final.save

      redirect_to("/finals/#{@final.id}", :notice => "Final updated successfully.")
    else
      render("final_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @final = Final.find(params.fetch("id_to_remove"))

    @final.destroy

    redirect_to("/finals", :notice => "Final deleted successfully.")
  end
end
