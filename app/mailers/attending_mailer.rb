class AttendingMailer < ApplicationMailer
    default from: 'eventlink@yopmail.com'

    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://event-link.herokuapp.com/'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Un gens :) à rejoint ton truc !')
    end
end