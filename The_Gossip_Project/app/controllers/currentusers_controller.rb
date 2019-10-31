class CurrentusersController < ApplicationController


    def show
    end

    def create

        
        my_user = User.find_by(email:params[:login_email]) # recherche de l'utilisateur en BDD 
        
        case my_user # case pour rediriger selon l'input user

        when nil # quand utilisateur non valide (n'existe pas en BDD)
            redirect_to new_currentuser_path #redirige formulaire d'identification
        when my_user.authenticate(params[:login_password]) # quand utlisateur correct et mot de passe correct
          then redirect_to welcome_logged_path(:id => my_user.first_name) # redirige vers bonjour prénom utlisateur
        end

        if my_user && my_user.authenticate(params[:login_password])
            session[:user_id]= my_user.id
        end
        # app/controllers/users_controller.rb

    end


    def edit
    end

    def update
    end

    def destroy
    
        reset_session
        session[:user_id] = nil         
        redirect_to welcome_path 
    end

end
