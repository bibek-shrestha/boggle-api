module Response
  def get_success_response(data, status)
    response = {data: data, status: status}
    render json: response, status: status
  end

  def get_error_response(error, status = :internal_server_error)
    response = {error: error.message, status: status}
    render json: response, status: status
  end
end
