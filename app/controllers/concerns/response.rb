module Response
  def get_json_response(data, status)
    if status == :ok
      response = {data: data, status: status}
    else
      response = {error: data, status: status}
    end
    render json: response, status: status
  end
end