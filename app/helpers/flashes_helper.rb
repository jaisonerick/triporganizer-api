module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice("alert", "error", "notice", "success")
  end

  def flash_class(key)
    { "alert" => "warning",
      "error" => "danger" ,
      "notice" => "info",
      "success" => "success" }.fetch(key)
  end
end
