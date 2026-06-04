#!/usr/bin/env python3

"""
Sample Python Script
Description: Demonstrates basic execution, input handling, and simple logic.
"""

def greet_user(name):
    return f"Hello, {name}! Welcome to Python execution."

def calculate_sum(a, b):
    return a + b

def main():
    print("=== Sample Python Script Execution ===")
    
    # Take user input
    name = input("Enter your name: ")
    print(greet_user(name))
    
    try:
        num1 = int(input("Enter first number: "))
        num2 = int(input("Enter second number: "))
        result = calculate_sum(num1, num2)
        print(f"Sum of {num1} and {num2} is: {result}")
    except ValueError:
        print("Invalid input! Please enter numeric values.")

    print("=== Script Execution Completed ===")

if __name__ == "__main__":
    main()

