class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def testimonials
  end

  def about_me
  end

  def faq
  end

  def legal
  end

  def rules
  end

  def calendar
  end

  def french_school
  end

  def newsletter
    require 'MailchimpMarketing'

    begin
      client = MailchimpMarketing::Client.new
      client.set_config({ api_key: ENV["MAILCHIMP_API_KEY"], server: ENV["MAILCHIMP_API_SERVER"] })

      response =
        client.lists.set_list_member(
          ENV["MAILCHIMP_LIST_ID"],
          Digest::MD5.hexdigest(params[:email].downcase),
          {
            'email_address' => params[:email],
            'status_if_new' => 'subscribed',
            'status' => 'subscribed'
          }
        )
      p response

      redirect_to success_path
    rescue MailchimpMarketing::ApiError => e
      puts "Error: #{e}"
      redirect_to failure_path
    end
  end

  def success
  end

  def failure
  end
end
