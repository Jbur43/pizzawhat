class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy edit_from_step ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  def flipper
  end

  # GET /orders/new
  def new
    @order = Order.create
    redirect_to edit_order_path(@order)
  end

  # GET /orders/1/edit
  def edit
    @order = @order
  end

  def edit_from_step
    @order = @order
    @step = params[:step_id]

    render :edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("orders", partial: "orders/order", locals: { order: @order }) }
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        # format.turbo_stream { render turbo_stream: turbo_stream.prepend("orders", partial: "orders/order", locals: { order: @order }) }
        format.html { redirect_to edit_order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order).permit(:name, toppings: [], extras: [])
    end
end
