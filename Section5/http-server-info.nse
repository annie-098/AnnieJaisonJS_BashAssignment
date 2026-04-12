id="simple_http_info"
description=[[Gets HTTP status, server, and title]]
author="Annie"
license="Same as Nmap"
categories={"default","safe"}
portrule=function(host,port)
return port.number==80 or port.number==8080
end
action=function(host,port)
local http=require "http"
local r=http.get(host,port,"/")
if not r then return "No response" end
local title=string.match(r.body or "","<title>(.-)</title>") or "Not found"
local server=(r.header and r.header["server"]) or "Unknown"
local status=r.status or "Unknown"
return "Status: "..status.."\nServer: "..server.."\nTitle: "..title
end
