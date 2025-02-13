# Library Application

![Rails Version](https://img.shields.io/badge/Rails-8.0.0+-red.svg)
![Ruby Version](https://img.shields.io/badge/Ruby-3.2.2+-blue.svg)

A full-featured book lending library application built with Ruby on Rails. Manage book inventory, user registrations, and book borrowing operations with ease.

## Features

- **User Authentication**
  - Secure registration and login system
  - Session management
  - Password hashing with bcrypt

- **Book Management**
  - Add books with title, author, and ISBN
  - Unique ISBN validation
  - Real-time availability status
  - Detailed book view with borrowing capability

- **Borrowing System**
  - Borrow books with automatic 2-week due date
  - Return books through user profile
  - Prevent duplicate borrowings
  - Track borrowing history

- **User Profile**
  - View currently borrowed books
  - See due dates for each borrowed book
  - Return books directly from profile

- **Validation & Security**
  - Model validations for data integrity
  - Database constraints
  - CSRF protection
  - Secure session management

## Requirements

- Ruby 3.2.2 or newer
- Rails 8.0.0 or newer
- Bundler

## Install dependencies
bundle install

## Set up the database
rails db:create
rails db:migrate

## Start the development server
rails server

# TESTING
## Full test suite:
rails test

## Specific test types:

# Models
rails test test/models

# Controllers
rails test test/controllers

# Integration
rails test test/integration

## APPLICATION LINK

http://localhost:3000