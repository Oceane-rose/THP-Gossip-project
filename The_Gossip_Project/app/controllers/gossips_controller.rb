
  class GossipsController < ApplicationController

  

    def new
      @gossip = Gossip.new
      end
  
    def create
      # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
      # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      
      @gossip = Gossip.new(title:params[:gossip_text], content:params[:gossip_content])# a changer quand fonction login user sera implémenté
      @gossip.user = User.find_by(id:session[:user_id])

      if @gossip.save 
      then redirect_to welcome_logged_path(id:@gossip.user.first_name)
      end

    end

    def show
      @gossip = Gossip.find(params[:id])
    end

    def edit
      @gossip =  Gossip.find(params[:id])
    end 


    def update
      @gossip = Gossip.find(params[:id])
      if @gossip.update(title: params[:gossip][:title], content: params[:gossip][:content])
      then redirect_to gossip_path(:id => @gossip.id)
      end
    end 

    def destroy
      @gossip = Gossip.find(params[:id])
      if @gossip.destroy
      then redirect_to welcome_path
      end
    end


  end

 
  


