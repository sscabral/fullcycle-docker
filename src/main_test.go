package main

import (
	"testing"
)

// TestHelloWorld is a unit test for the HelloWorld function.
func TestHelloWorld(t *testing.T) {
	result := HelloWorld()
	expected := "Full Cycle Rocks!!"

	if result != expected {
		t.Errorf("Expected %s, but got %s", expected, result)
	}
}

// HelloWorld is used as a test parameter, returning the string "Full Cycle Rocks!!".
func HelloWorld() string {
	return "Full Cycle Rocks!!"
}
