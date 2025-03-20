# require 'cgi'
# module URI
#   def self.escape(string)
#     CGI.escape(string)
#   end
# end

module URI
  def URI.escape(url)
    url
  end
end
