package main

import (
	"flag"
	"log"
	"net/http"
)

var (
	listenAddr      string
	publicDirectory string
)

func init() {
	flag.StringVar(&listenAddr, "l", ":80", "Listen address")
	//flag.StringVar(&publicDirectory, "p", "./public", "Public directory to serve")
  flag.StringVar(&publicDirectory, "p", "./../site", "Public directory to serve")
  log.Printf("server publicDirectory : addr=%s \n", publicDirectory)
}

func main() {
	flag.Parse()
	log.Printf("starting server: addr=%s\n", listenAddr)
	log.Fatal(http.ListenAndServe(listenAddr, http.FileServer(http.Dir(publicDirectory))))
}
