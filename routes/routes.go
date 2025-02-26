package routes

import (
	"event-booking-api/controllers"
	"event-booking-api/middleware"

	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {
	api := app.Group("/api")

	auth := api.Group("/auth")
	auth.Post("/register", controllers.Register)
	auth.Post("/login", controllers.Login)

	events := api.Group("/events")
	events.Use(middleware.AuthMiddleware())
	events.Get("/", controllers.GetEvents)
	events.Post("/", controllers.CreateEvent)
	events.Get("/:id", controllers.GetEvent)
	events.Put("/:id", controllers.UpdateEvent)
	events.Delete("/:id", controllers.DeleteEvent)
}
