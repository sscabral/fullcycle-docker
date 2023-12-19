package main

import (
	"testing"
)

func TestHelloWorld(t *testing.T) {
	result := HelloWorld()
	expected := "Full Cycle Rocks!!"

	if result != expected {
		t.Errorf("Expected %s, but got %s", expected, result)
	}
}

func HelloWorld() string {
	return "Full Cycle Rocks!!"
}
