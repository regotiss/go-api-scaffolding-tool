package init

import (
	"fmt"
	"os"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

func InitializeDB() *gorm.DB {
	db, err := gorm.Open("postgres", os.Getenv("DB_URL"))
	if err != nil {
		panic(fmt.Sprintln("Could not connect to database", err))
	}
	db.LogMode(true)
	return db
}
