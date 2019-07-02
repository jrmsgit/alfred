// Copyright (c) Jeremías Casteglione <jrmsdev@gmail.com>
// See LICENSE file.

package core

import (
	"sync"

	"github.com/jrmsdev/alfred/log"
)

func Start(wg *sync.WaitGroup) {
	log.Debug("core worker")
	defer wg.Done()
}
