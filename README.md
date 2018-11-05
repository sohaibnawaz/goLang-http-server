# A Simple HTTP Web Server Made in GO

This project looks at building a simple HTTP web sever using the GO language.

## Walking Through the Code

These walkthrough will take you through what each line of code is doing.

### Import

For this project we use the net pacakge in GO called net. The net package provides a portable interface for network I/O, including TCP/IP, UDP, domain name resolution, and Unix domain sockets. A subdirectory within net is http, with this package we can HTTP client and server implementations.
```
import (
        "net/http"
)
```

### main()

ListenAndServe starts an HTTP server with a given address and handler. The handler is usually nil, which means to use DefaultServeMux. Handle and HandleFunc add handlers to DefaultServeMux. HandleFunc registers the handler function for the given pattern in the DefaultServeMux.

```
http.HandleFunc("/", rootHandler)
```

Handle registers the handler for the given pattern in the DefaultServeMux. The documentation for ServeMux explains how patterns are matched.

```
http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
```

ListenAndServe listens on the TCP network address addr and then calls Serve with handler to handle requests on incoming connections. Accepted connections are configured to enable TCP keep-alives. The handler is typically nil, in which case the DefaultServeMux is used. ListenAndServe always returns a non-nil error

```
http.ListenAndServe(":9000", nil)
```

ServeFile replies to the request with the contents of the named file or directory.

If the provided file or directory name is a relative path, it is interpreted relative to the current directory and may ascend to parent directories. If the provided name is constructed from user input, it should be sanitized before calling ServeFile.

As a precaution, ServeFile will reject requests where r.URL.Path contains a ".." path element; this protects against callers who might unsafely use filepath.Join on r.URL.Path without sanitizing it and then use that filepath.Join result as the name argument.

As another special case, ServeFile redirects any request where r.URL.Path ends in "/index.html" to the same path, without the final "index.html". To avoid such redirects either modify the path or use ServeContent.

Outside of those two special cases, ServeFile does not use r.URL.Path for selecting the file or directory to serve; only the file or directory provided in the name argument is used.

```
http.ServeFile(w, r, "static/index.html")
```
