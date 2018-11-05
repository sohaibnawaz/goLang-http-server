package main

import (
        "net/http"
)

func main() {
    http.HandleFunc("/", rootHandler)
    http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
    http.ListenAndServe(":9000", nil)
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
    http.ServeFile(w, r, "static/index.html")
}
