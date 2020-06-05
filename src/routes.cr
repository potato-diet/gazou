require "kemal"
require "./helpers"

module Gazou
  get "/images/:filename" do |env|
    filename = env.params.url["filename"]
    filepath = File.join(["images", filename])
    
    if !File.exists?(filepath)
      env.response.status_code = 404
      next
    end

    send_file(env, filepath)
  end

  post "/api/upload" do |env|
    filepath = ""

    HTTP::FormData.parse(env.request) do |upload|
      filename = Helpers.randomize_filename(upload.filename.to_s)
      filepath = File.join("images", filename)

      File.open(filepath, "w") do |f|
        IO.copy(upload.body, f)
      end

      checksum = Helpers.get_checksum(filepath)

      if image = Image.find_by(checksum: checksum)
        File.delete(File.join("images", filename))

        filepath = File.join("images", image.filename)
      else
        Image.create(filename: filename, checksum: checksum)
      end
    end

    filepath
  end
end
