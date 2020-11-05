class UserMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendee_event_subscription_email(user, event)
    @user = user
    @event = event
    @url = "http://eventbriteapp-raph.herokuapp.com/events/#{@event.id}"
    mail(to: @user.email, subject: "Vous êtes inscrit à un event !")
  end

  def admin_event_subscription_email(user, event)
    @user = user
    @event = event
    @url = "http://eventbriteapp-raph.herokuapp.com/events/#{@event.id}"
    mail(to: @user.email, subject: "Quelqu'un s'est inscrit à un de vos event !")
  end
end
