Spree::Admin::VariantsController.class_eval do
  # this loads the variant for the master variant volume price editing
  def load_resource_instance
    parent
    if new_actions.include?(params[:action].to_sym)
      build_resource
    elsif params[:id]
      Spree::Variant.find(params[:id])
    end
  end

  def edit
    @variant.volume_prices.build
    #TODO: This creates empty row, which is passed and attempted to validate/save
    super
  end
  
  def volume_prices
    @product = @variant.product
    #@variant.volume_prices.build #TODO: This creates empty row, which is passed and attempted to validate/save
  end

  def location_after_save
    if @product.master.id == @variant.id and params[:variant].has_key? :volume_prices_attributes
      return volume_prices_admin_product_variant_url(@product, @variant)
    end

    super
  end
end
