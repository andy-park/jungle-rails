class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
    
     def order_email(user, order)
       @user = user
       @order = order
       mail(to: @user.try(:email), subject: 'Confirmation for Order #<%= @order.id %>')
     end
end
