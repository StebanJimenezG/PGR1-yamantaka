class ClientsController < ApplicationController
before_action :require_user, except: [:index, :show]
  #get /categories
  def index
    @clients = Client.all
  end
  #get /categories/#codigo
  def show
    @client = Client.find(params[:id])

  end
  #get categories/new
  def new
    @client = Client.new
  end
  #post /categories/
  def create
    #@category = Category.new(codigo: params[:category][:codigo], nombre: params[:category][:nombre], descripcion: params[:category][:descripcion])
    @client = Client.new(client_params)
    @client.f_pago = params[:formaDePago]
    @client.societyId = params[:society_id]
    @client.valor=params[:valor_pago]
    @client.soporte = params[:soporte]
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path

  end
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end
  def edit
    @client = Client.find(params[:id])

  end
  def membership
    @client = Client.new
    @societys = Society.all
    @formasDePago = FormaDePago.all
    @society_options = Society.all.map{ |u| [ u.nombre, u.id ] }

  end

  #Metodos privados de la clase
  private

  def client_params
    params.require(:client).permit(:tipo_documento, :documento, :nombre, :apellido, :telefono, :direccion, :pais, :ciudad, :email, :society_id, :valor_pago, :formaDePago, :soporte)
  end

end
