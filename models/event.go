package models

import (
	"time"

	"gorm.io/gorm"
)

type Event struct {
	ID          uint           `gorm:"primaryKey"`
	Title       string         `json:"title"`
	Description string         `json:"description"`
	Date        time.Time      `json:"date"`
	Location    string         `json:"location"`
	CreatedAt   time.Time      `gorm:"autoCreateTime"`
	UpdatedAt   time.Time      `gorm:"autoUpdateTime"`
	DeletedAt   gorm.DeletedAt `gorm:"index"` // Soft delete support
}
