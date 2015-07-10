BigPanda API
==============

About
-------

This library allows for posting arbitrary alerts to the Big Panda API.

This is different from the bigpanda gem as this is for passing arbitrary alerts to the Big Panda API, rather than handling a deployment notification.

Usage
----------

require 'bigpanda-api'

    ENV['BIGPANDA_KEY'] = 'aaaaaaaaaaaaaaaaaaaaa'
    ENV['BIGPANDA_APP_KEY'] = 'bbbbbbbbbbbbbbbbbbbbbbb'
    bp = BigPandaAPI.new()
    data = {
      'status' => 'critical', # ok, critical, warning, acknowledged
      'host' => 'testhost1.test.com', # host / service / application
      'check' => 'disk1',
      'description' => 'disk i/o is too high',
      'cluster' => 'instance:customer-product-test',
      'randomkey1' => 'randomvalue2',
      'alert_url' => 'http://somealerturl.test.com/testalerturl'
    }
    bp.post(data)

