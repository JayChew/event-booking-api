package controllers

import (
	"event-booking-api/database"
	"event-booking-api/models"

	"github.com/gofiber/fiber/v2"
)

// func SetupRoutes(app *fiber.App) {
// 	api := app.Group("/api")

// 	api.Get("/events", GetEvents)
// 	api.Post("/events", CreateEvent)
// 	api.Get("/events/:id", GetEvent)
// 	api.Put("/events/:id", UpdateEvent)
// 	api.Delete("/events/:id", DeleteEvent)
// }

func GetEvents(c *fiber.Ctx) error {
	var events []models.Event
	database.DB.Find(&events)
	return c.JSON(events)
}

func CreateEvent(c *fiber.Ctx) error {
	event := new(models.Event)
	if err := c.BodyParser(event); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "Invalid input"})
	}
	database.DB.Create(event)
	return c.Status(201).JSON(event)
}

func GetEvent(c *fiber.Ctx) error {
	id := c.Params("id")
	var event models.Event
	if err := database.DB.First(&event, id).Error; err != nil {
		return c.Status(404).JSON(fiber.Map{"error": "Event not found"})
	}
	return c.JSON(event)
}

func UpdateEvent(c *fiber.Ctx) error {
	id := c.Params("id")
	var event models.Event
	if err := database.DB.First(&event, id).Error; err != nil {
		return c.Status(404).JSON(fiber.Map{"error": "Event not found"})
	}
	if err := c.BodyParser(&event); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "Invalid input"})
	}
	database.DB.Save(&event)
	return c.JSON(event)
}

func DeleteEvent(c *fiber.Ctx) error {
	id := c.Params("id")
	database.DB.Delete(&models.Event{}, id)
	return c.Status(200).JSON(fiber.Map{"message": "Event deleted"})
}
