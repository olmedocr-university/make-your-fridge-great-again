class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_units

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_to do |format|
      format.html {render :index}
      format.json {render :index, status: :ok}
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    if Owner.all.first.nil?
      redirect_to owners_url, error_message: 'You need to create a user first!'
    else
      @product = Product.new
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    owner = Owner.find(product_params[:owner_id])
    category = Category.find(product_params[:category_id])
    food = Food.find(product_params[:food_id])
    @product.build_owner(id: owner.id)

    respond_to do |format|
      if @product.save
        format.html {redirect_to @product, notice: 'Product was successfully created.'}
        format.json {render :show, status: :created, location: @product}
      else
        format.html {render :new}
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html {redirect_to @product, notice: 'Product was successfully updated.'}
        format.json {render :show, status: :ok, location: @product}
      else
        format.html {render :edit}
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html {redirect_to products_url, notice: 'Product was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :purchase_date, :owner_id, :expiration_date, :category_id, :food_id, :amount, :units)
  end

  def set_units
    @units = Product.units
  end

end
