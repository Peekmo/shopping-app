class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /categories/1/products
  # GET /categories/1/products.json
  def index
    @products = Category.find(params[:category_id]).products
  end

  # GET /categories/1/products/1
  # GET /categories/1/products/1.json
  def show
  end

  # GET /categories/1/products/new
  def new
    @product = Product.new
    @product.category = Category.find(params[:category_id])
  end

  # GET /categories/1/products/1/edit
  def edit
  end

  # POST /categories/1/products
  # POST /categories/1/products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1/products/1
  # PATCH/PUT /categories/1/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1/products/1
  # DELETE /categories/1/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to categories_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      product = Product.find(params[:id])

      @product = product unless product.category.id != params[:category_id].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name)
    end
end
