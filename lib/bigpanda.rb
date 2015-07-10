#!/usr/bin/env ruby

require 'restclient'
require 'json'

class BigPanda
  attr_accessor :raise_errors
  attr_accessor :debug
  class Timeout < RestClient::RequestTimeout
  end
  DEFAULT_OPTIONS = {
    :timeout => 300,
    :open_timeout => 300,
    :verify_ssl => false
  }
  def initialize(options={})
    @raise_errors = false
    @debug = true
    @base_url = 'https://api.bigpanda.io/data/v2/alerts'
    @key = ENV['BIGPANDA_KEY']
    @appkey = ENV['BIGPANDA_APP_KEY']
    raise "No BIGPANDA_KEY environment var is set, bailing!" unless @key
    @headers = {
      'Authorization' => "Bearer #{@key}",
      'Content-Type' => 'application/json'
    }
    @options = DEFAULT_OPTIONS.merge(options)
    @rest = RestClient::Resource.new @base_url, :timeout => @options[:timeout], :open_timeout => @options[:open_timeout], :verify_ssl => @options[:verify_ssl]
  end
  def post(data,appkey=nil)
    appkey ||= @appkey
    raise "No app key var or environment var was passed, bailing!" unless appkey
    data['app_key'] = appkey
    begin
      r = @rest.post JSON.generate(data), @headers
    rescue RestClient::Forbidden,RestClient::BadRequest,RestClient::InternalServerError,RestClient::MethodNotAllowed => e
      err = JSON.parse(e.response)
      print "Error (#{e.http_code}): ",err['error']," [#{e.http_body}]\n" if @debug
      raise if @raise_errors
      return nil,err
    rescue RestClient::RequestTimeout
      raise BigPanda::Timeout
    end
    return r
  end
end
