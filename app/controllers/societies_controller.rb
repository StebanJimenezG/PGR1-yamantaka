class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]

  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
 # before_action :require_user, except: [:index, :show]
  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.all
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    @society = Society.new
  end

  # GET /societies/1/edit
  def edit
  end

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)
    @categories=Category.all
    @society.user = current_user
    respond_to do |format|
      if @society.save
        flash[:notice] = "Felicidades has creado una sociedad"
        format.html { redirect_to @society, notice: 'Society was successfully created.' }
        format.json { render :show, status: :created, location: @society }
      else
        format.html { render :new }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    respond_to do |format|
      if @society.update(society_params)
        flash[:notice] = "Has actualizado una sociedad"
        format.html { redirect_to @society, notice: 'Society was successfully updated.' }
        format.json { render :show, status: :ok, location: @society }
      else
        format.html { render :edit }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url, notice: 'Society was successfully destroyed.' }
      format.json { head :no_content }
    end

    end
  end
def
  menuSociedades
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

  def require_same_user
   if current_user != @society.user and !current_user.admin?
       flash[:danger] = "solo puedes editar la sociedad que hallas creado"
        redirect_to root_path
        
   end

  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def society_params
    params.require(:society).permit(:nombre, :descripcion, :val_anual, :val_semestral, :val_mensual,
                                    :discounts_attributes => [:id, :discount_porcentaje, :society_id, :category_id, :_destroy,
                                    :category_attributes => [:id, :nombre]] )
  end

