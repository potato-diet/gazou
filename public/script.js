Dropzone.options.uploadBox = {
  paramName: "image",
  maxFilesize: 10,
  createImageThumbnails: false,
  acceptedFiles: "image/*",

  init: function() {
    console.log(this);
  },

  success: (file, response) => {
    let link = document.querySelector("#success-link");
    link.setAttribute("href", `/${response}`);
    link.innerText = response;
  }
};
