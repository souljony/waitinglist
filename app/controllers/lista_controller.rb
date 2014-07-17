class ListaController < ApplicationController
  before_action :set_listum, only: [:show, :edit, :update, :destroy]
  autocomplete :cliente, :nome
  
  def sentar
    @listum = Listum.find(params[:id])
  	@listum.toggle!(:sentado)
  	@listum.update_attribute(:sentado_em, Time.now)
  	redirect_to :lista
  end
  
  # GET /lista
  # GET /lista.json
  def index
    @lista = Listum.where("strftime('%m/%d', created_at) = ?", Dium.last.created_at.strftime('%m/%d'))
    @clientes = Cliente.all
  end

  # GET /lista/1
  # GET /lista/1.json
  def show
  end

  # GET /lista/new
  def new
    @listum = Listum.new
  end

  # GET /lista/1/edit
  def edit
  end

  # POST /lista
  # POST /lista.json
  def create
  	@cliente1 = Cliente.find_by_nome(listum_params[:nome])
  	if @cliente1.blank? && !listum_params[:nome].blank?
  	@savecliente = Cliente.new(nome: listum_params[:nome])
  	@savecliente.save
  	end
  	@cliente2 = Cliente.find_by_nome(listum_params[:nome])
    @listum = Listum.new(listum_params.merge!(cliente_id: @cliente2.id))
    respond_to do |format|
      if @listum.save
        format.html { redirect_to @listum, notice: 'Listum was successfully created.' }
        format.json { render :show, status: :created, location: @listum }
      else
        format.html { render :new }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista/1
  # PATCH/PUT /lista/1.json
  def update
    respond_to do |format|
      if @listum.update(listum_params)
        format.html { redirect_to @listum, notice: 'Listum was successfully updated.' }
        format.json { render :show, status: :ok, location: @listum }
      else
        format.html { render :edit }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista/1
  # DELETE /lista/1.json
  def destroy
    @listum.destroy
    respond_to do |format|
      format.html { redirect_to lista_url, notice: 'Listum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listum
      @listum = Listum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listum_params
      params.require(:listum).permit(:nome, :pax, :sentado, :sentado_em, :cliente_id)
    end
end
