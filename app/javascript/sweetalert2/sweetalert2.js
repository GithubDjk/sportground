import swal from "sweetalert2";
import Rails from "@rails/ujs";

Rails.confirm = function (message, element) {
  const swalWithBootstrap = swal.mixin({
    buttonsStyling: true,
  });

  swalWithBootstrap
    .fire({
      html: message,
      title: "Confirm Alert",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "Cancel",
    })
    .then((result) => {
      if (result.value) {
        element.removeAttribute("data-confirm");
        element.click();
      }
    });
};