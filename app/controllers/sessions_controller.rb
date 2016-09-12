class SessionsController < ApplicationController

    def new
    
    end
    
    
    def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "has ingresado satisfactoriamente"
        redirect_to societies_path
    else
        flash.now[:danger] = "hubo un error con tu informacion de ingreso"
    render 'new'
    end
    end

    def destroy
    session[:user_id] = nil
    flash[:success] = "Te has desconectado"
    redirect_to root_path
    end

end