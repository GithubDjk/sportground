module ApplicationHelper
  # def custom_bootstrap_flash
  #   flash_messages = []
  #   flash.each do |type, message|
  #     type = 'success' if type == 'notice'
  #     type = 'error'   if type == 'alert'
  #     text = "<script>toastr.#{type}('#{message}');</script>"
  #     flash_messages << text.html_safe if message
  #   end
  #   flash_messages.join("\n").html_safe
  # end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
      end
  end
end
