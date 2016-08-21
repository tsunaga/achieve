class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
      if params[:back]
        @contact = Contact.new(contact_params)
      else
        @contact = Contact.new
      end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.create(contact_params)
        if @contact.save
            redirect_to :root, notice: "お問い合わせが完了しました！"
        else
            render action: 'new'
        end
  end
  
  def confirm
      @contact = Contact.new(contact_params)
      render :new if @contact.invalid?

  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
    
end
