class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]

  # GET /tareas
  # GET /tareas.json
  def index
    @tareas = Tarea.where(terminada: false)
    @tareasterminadas = Tarea.where(terminada: true)
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
  end

  # GET /tareas/new
  def new
    @tarea = Tarea.new
  end

  # GET /tareas/1/edit
  def edit
  end

  # POST /tareas
  # POST /tareas.json
  def create
    @tarea = Tarea.new(tarea_params)
    respond_to do |format|
      if @tarea.save
        format.html { redirect_to @tarea, notice: 'Tarea was successfully created.' }
        format.json { render :show, status: :created, location: @tarea }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tareas/1
  # PATCH/PUT /tareas/1.json
  def update
    @tarea = Tarea.find(params['id'])
    respond_to do |format|
      if @tarea.toggle!(:terminada);
          format.js
      else
         format.js
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarea_params
      params.require(:tarea).permit(:nombre, :terminada)
    end
end
