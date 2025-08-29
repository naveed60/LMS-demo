class Admin::EnrollmentsController < Admin::MainController
    
    def index
        @enrollments=Enrollment.all
        @count = @enrollments.count
        respond_to do |format|
            format.html
            format.turbo_stream { render turbo_stream:[turbo_stream.update('main', template: 'admin/enrollments/index')                    
                ] }
        end

    end


    def new
        @enrollment=Enrollment.new
    end
    def create
        semester_id=Section.find(params[:enrollment][:section_id]).semester_id
        @enrollment=Enrollment.new(enrollment_params)
        @enrollment.semester_id=semester_id
        if @enrollment.save
            flash[:notice] = "Enrollment was successfully Create."
            redirect_to admin_enrollments_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @enrollment=Enrollment.find(params[:id])
    end

    def update
        @enrollment=Enrollment.find(params[:id])
        semester_id=Section.find(params[:enrollment][:section_id]).semester_id
        @enrollment.semester_id=semester_id
        if @enrollment.update(enrollment_params)
            flash[:notice] = "Enrollment was successfully Updated."
            redirect_to admin_enrollments_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @enrollment=Enrollment.find(params[:id])
        @enrollment.destroy
        flash[:notice] = "Enrollment was successfully Delete."
        redirect_to admin_enrollments_path
    end

    private
    
    def enrollment_params
        params.require(:enrollment).permit(:student_id,:section_id,:grade_id)
    end
end
