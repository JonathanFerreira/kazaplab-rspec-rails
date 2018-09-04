module RequestSpecHelper
  def json
    JSON.parse body
  end
end
