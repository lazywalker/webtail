package main

import (
	"flag"
	"fmt"
	"log"
)

//AppVersion 1.0
var AppVersion = "1.0"

var (
	basedir, address string
	version          bool
)

func main() {
	flag.StringVar(&basedir, "d", "", "dir path of log files")
	flag.StringVar(&address, "l", ":8100", "listen address")
	flag.BoolVar(&version, "v", false, "show version")
	flag.Parse()
	if version {
		fmt.Println(AppVersion)
		return
	}
	if basedir == "" {
		flag.Usage()
		return
	}
	listener, err := serve(address, basedir)
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("tail server on %s", (*listener).Addr())
	select {}
}
