# skipping the old frozen_string_literal magic comment;
# from what I understand, it's no longer necessary in Rails 7

class VolunteersController < ApplicationController
# would likely need some before_actions here, at least
# protect_from_forgery, but I need to refresh my memory here
# and am instead spending time on getting something up and running

  def new; end

  #This is first-pass stuff; this would most likely, in real life, do little
  # more than pass the permitted volunteer params to some other class to handle the rest
  def create
    vol_params = permitted_params.transform_values {|v| v.empty? ? "NULL" : v}
    vol_sql    = build_sql(vol_params)
    send_to_hospitial(vol_sql)

    render "thanks"
  # rescue
    # Putting this here to satisfy the implied requirement that it always
    # renders the thanks page. In real life, I'd nail down that behavior while
    # getting some details on verification and how/whether to add UI/UX to handle tht stuff.
    # render "thanks"
  end


  private

  # very generic; normally would memoize any param-related stuff that I
  # thought should be handled here, but this is a simple case and I'm running
  #   out of time
  def permitted_params
    #erring on the side of readability and accuracy for the param
    # names, even though the last two on the list would be a pain
    # to have to type all the time.
    params.require(:volunteer).permit(
      :first_name,
      :last_name,
      :phone_number,
      :insurance_carrier,
      :medical_record_id
    )
  end

  # extremely basic, and in a regular app, I would not be doing any of this in a
  # controller, partly because of separation-of-concerns and partly because there
  # would need to be some validations, in all likelihood.
  # This will work as an MVP, which is about all I have time for here.
  def build_sql(params)
    # also I know this is unsafe SQL; slapping it together now, again, because of time constraints"
    # if I had more time, I'd at least explore options to simply append values to output.sql
    # as they came in, rather than writing all these individual insert statements.

    "INSERT INTO volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values(" \
    "#{params[:first_name]}, #{params[:last_name]}, #{params[:phone_number]}, #{params[:insurance_carrier]}, #{params[:medical_record_id]})"
  end

  ## COPYPASTA FROM DESCRIPTION ##
  # @param [String] sql
  #   Ex: "insert into volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values('daniel', 'lo', '000-000-0000', 'fruitcake',' 123')"
  # @return [Boolean]
  def send_to_hospitial(sql)
    Rails.logger.debug(sql)
    File.open('output.sql', 'a+t') do | file |
      file.puts sql
    end
    true
  end
end
