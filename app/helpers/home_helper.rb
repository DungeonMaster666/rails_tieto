module HomeHelper
  def show_svg(path, options= {})
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end
end
