class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end
  
  def create
    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    contact.save
    flash[:success] = "Contact Succesfully Created"
    redirect_to "/contacts/#{contact.id}"
  end
  
  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"  
  end
  
  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end
  
  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save
    flash[:success] = "Contact Succesfully Updated"
    redirect_to "/contacts/#{@contact.id}"
  end
  
  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.delete
    flash[:danger] = "Contact Succesfully Destroyed"
    redirect_to "/contacts"
  end

  def search
    search = params[:search_terms]
    @contacts = Contact.where("first_name iLIKE ?", "%#{search}%" )
    render "index.html.erb"  
  end
            
end
