package main

import (
	_ "github.com/jrmsdev/alfred/internal/server/api/routers"

	"github.com/jrmsdev/alfred/internal/server"

	"github.com/astaxie/beego"
)

func main() {
	beego.BConfig.Listen.AdminPort = 27720
	beego.BConfig.WebConfig.AutoRender = false
	server.Start("core", "127.0.0.1:27719")
}
