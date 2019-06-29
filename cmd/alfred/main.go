// Copyright (c) Jeremías Casteglione <jrmsdev@gmail.com>
// See LICENSE file.

package main

import (
	"github.com/jrmsdev/alfred/internal/core"
	"github.com/jrmsdev/alfred/internal/flags"
	"github.com/jrmsdev/alfred/log"
)

func main() {
	flags.Parse()
	log.Debug("start")
	core.Main()
	log.Debug("end")
}