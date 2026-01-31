// OrangeVim Theme Demo - Go
// This file showcases Go syntax highlighting

package main

import (
	"fmt"
	"errors"
	"time"
)

// Constants and variables
const (
	MaxRetries = 3
	Timeout    = 30 * time.Second
)

var (
	globalCounter int
	isActive      bool = true
)

// User represents a user in the system
type User struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Email     string    `json:"email"`
	Age       int       `json:"age"`
	CreatedAt time.Time `json:"created_at"`
}

// UserService handles user operations
type UserService interface {
	CreateUser(name, email string, age int) (*User, error)
	GetUser(id int) (*User, error)
	DeleteUser(id int) error
}

// NewUser creates a new user instance
func NewUser(name, email string, age int) *User {
	return &User{
		Name:      name,
		Email:     email,
		Age:       age,
		CreatedAt: time.Now(),
	}
}

// Greet prints a greeting message
func (u *User) Greet() string {
	if u.Age >= 18 {
		return fmt.Sprintf("Hello, %s!", u.Name)
	}
	return fmt.Sprintf("Hi, %s!", u.Name)
}

// IsAdult checks if user is an adult
func (u *User) IsAdult() bool {
	return u.Age >= 18
}

// Error handling
func riskyOperation() error {
	if !isActive {
		return errors.New("service is not active")
	}
	return nil
}

// Main function with various features
func main() {
	// String and number literals
	message := "Hello, World!"
	count := 42
	price := 19.99
	fmt.Printf("Price: $%.2f\n", price)

	// Array and slice
	numbers := []int{1, 2, 3, 4, 5}
	users := make([]*User, 0, 10)

	// Map
	userMap := map[int]*User{
		1: NewUser("Alice", "alice@example.com", 25),
		2: NewUser("Bob", "bob@example.com", 30),
	}

	// For loops
	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			fmt.Printf("%d is even\n", i)
		} else {
			fmt.Printf("%d is odd\n", i)
		}
	}

	// Range loop
	for _, user := range userMap {
		fmt.Println(user.Greet())
	}

	// Switch statement
	switch count {
	case 0:
		fmt.Println("Zero")
	case 42:
		fmt.Println("The answer!")
	default:
		fmt.Println("Something else")
	}

	// Error handling
	if err := riskyOperation(); err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	// Channel and goroutine
	ch := make(chan string, 1)
	go func() {
		ch <- "Hello from goroutine"
	}()

	select {
	case msg := <-ch:
		fmt.Println(msg)
	case <-time.After(Timeout):
		fmt.Println("Timeout")
	}

	// TODO: Add more features
	// FIXME: Fix the memory leak
	// WARN: This API is deprecated
	// NOTE: Update documentation

	fmt.Println(message, numbers, users)
}
