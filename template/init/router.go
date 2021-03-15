package init

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func InitilizeRoutes() *gin.Engine {
	router := gin.Default()
	addRoutes(router)
	return router
}

func addRoutes(router *gin.Engine) {
	addHealthEndpoint(router)
}

func addHealthEndpoint(router *gin.Engine) {
	router.GET("api/healthz", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{"status": "UP"})
	})
}
