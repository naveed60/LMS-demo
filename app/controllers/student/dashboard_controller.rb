class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    layout 'student'
    def index
        
    end

    def show_profile
        @student=Student.find(current_student.id)
    end

    def show_transcript
        @semesters = current_student.semesters
    end

    def display_all_courses
        @enrollments=current_student.semesters.where(id:current_student.student_semesters.last.semester_id)[0].enrollments.where(student_id:current_student.id)
    end

    def attendance
        @attendances = Attendance.joins(:enrollment)
                                 .where(enrollments: { student_id: current_student.id })
                                 .includes(enrollment: [:semester, section: :course])
                                 .order(date: :desc)
    end

    def fees
        @fees = current_student.fees.order(due_date: :asc)
    end

    def upload_image
        @student=Student.find(current_student.id)
        if @student.image.attach(params[:image])
            update_img
        end
    end
end
