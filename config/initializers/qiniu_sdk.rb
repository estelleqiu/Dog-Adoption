#!/usr/bin/env ruby

require 'qiniu'

Qiniu.establish_connection! :access_key => Rails.application.secrets.access_key,
                            :secret_key => Rails.application.secrets.secret_key

Rails.application.config.qiniu_domain = "p4wgbyuaw.bkt.clouddn.com"