package routes

import (
	"hackathon-api/controllers"

	"github.com/gin-gonic/gin"
)

func DonationRoute(router *gin.Engine) {
	router.POST("/donation", controllers.CreateDonation())
	router.GET("/donation/:donationId", controllers.GetADonation())
	router.DELETE("/donation/:donationId", controllers.DeleteADonation())
	router.GET("/donations", controllers.GetAllDonations())
	router.GET("/document/:donationId", controllers.DownloadDonation())
	router.GET("/money", controllers.GetMoney())
}
