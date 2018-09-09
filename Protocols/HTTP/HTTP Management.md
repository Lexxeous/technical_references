<!-- HTTP Management -->

# <img src="../../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's HTTP Management: <img src="../../.pics/Protocols/HTTP/http_logo.png" width="130"/>
### Manage HTTP & HTTPS Pages.

##### General HTTP Information.

HTTP stands for "Hyper-Text Transfer Protocol".<br>
It's how browsers & web servers communicate; it's important to understand if you want to write any kind of web application.<br>
HTTP is a stateless protocol. Every request is different from the last, that's why we need to use Cookies for user sessions.<br>

* **Version 1.1** (the most common) is text-based. This means that you can understand it without any special tools.
* **Version 2.0** is binary based. Binary protocols require special tools to work with but they are more efficient.

##### HTTP Request Messages.

HTTP request messsages consist of a request line, header lines, a blank line, and the message (entity) body.<br>
<img src="../../.pics/Protocols/HTTP/request_format.png" width="500px"/>

```
# Example request message.
GET /somedir/page.html HTTP/1.1
Host: www.someurl.com
Connection: close
User-agent: Mozilla/5.0
Accept-language: fr

(request message data ...)
```

##### HTTP Response Messages.

HTTP response messsages consist of a status line, header lines, a blank line, and the message (entity) body.<br>
<img src="../../.pics/Protocols/HTTP/response_format.png" width="500px"/>

```
# Example response message.
HTTP/1.1 200 OK
Connection: close
Date: Sun, 09 Sep 2018 15:12:46 GMT
Server: Apache/2.2.3 (CentOS)
Last-Modified: Sun, 09 Sep 2018 14:06:35 GMT
Content-Length: 6821
Content-Type: text/html

(response message data ...)
```

##### HTTP Status Codes.

| Value      | Title                      | Description                                                                                  |
|:----------:|:--------------------------:|:---------------------------------------------------------------------------------------------|
| 200        | OK                         | Request succeeded and the information is returned in the response.                           |
| 301        | Moved Permanently          | New URL is specified in `Location:` header. Client software automatically retrieves new URL. |
| 400        | Bad Request                | Generic error code indicating that the request could not be understood by the server.        |
| 404        | Not Found                  | The requested document/file/page does not exist on the server.                               |
| 500        | HTTP Version Not Supported | The requested HTTP protocol version is not supported by the server.                          |

### Use HTTP Requests with RoR.

##### Doing something specific.

```sh
# Comment
Code
```

##### Useful HTTP Related RoR Gems.

* [faraday](https://github.com/lostisland/faraday)
* [httparty](https://github.com/jnunemaker/httparty)
* [rest-client](https://github.com/rest-client/rest-client)
* [typhoeus](https://github.com/typhoeus/typhoeus)


For more information visit the site(s):

* [The Ultimate Guide to HTTP Requests in Ruby by Jesus Castello](https://www.rubyguides.com/2018/08/ruby-http-request/?tl_inbound=1&tl_target_all=1&tl_form_type=1&tl_period_type=3)
