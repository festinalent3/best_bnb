module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def create_new_user
    @user = User.create(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
  end

  def create_new_space
    @space = Space.create(
    title: params[:title],
    price: params[:price],
    description: params[:description],
    available_dates: DateRange.generate_range(params[:from_date], params[:to_date]),
    requested_dates: [],
    user: User.get(session[:user_id]))
  end

  def update_space
    @space = Space.get(params[:space_id].to_i)
    @space.update(
    :title => params[:title],
    :price => params[:price],
    :description => params[:description],
    :requested_dates => @space.requested_dates,
    :available_dates => DateRange.generate_range(params[:from_date], params[:to_date])
    )
  end

  def add_first_request
    @space.update(:requested_dates => [DateRange.request_dates(params[:check_in_date],
    params[:check_out_date],
    session[:user_id])])
  end

  def add_more_requests
    Space.store_multiple_requests(@space, params[:check_in_date], params[:check_out_date], session[:user_id])
  end

  def book_space_these_dates
    session[:space_id] = params[:space_id]
    @space = Space.get(params[:space_id].to_i)
    @space.update(:available_dates => DateRange.book_dates(params[:check_in_date],
    params[:check_out_date],
    @space.available_dates))
  end

end
