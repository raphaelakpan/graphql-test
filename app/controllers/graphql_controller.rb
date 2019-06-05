class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
    }
    result = GraphqlTestSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    handle_error e
  end

  private

  def current_user
    return unless request.headers['Authorization'].present?
    Users::DecodeUser.new(token: request.headers['Authorization']).perform
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error(e)
    errors = if e.class.to_s.match /ActiveRecord/
               e.record.errors.full_messages
             else
               [e.message]
             end

    logger.error e.message
    logger.error e.backtrace[0..5].join("\n")

    render json: { errors: errors, data: {} }, status: 500
  end
end
