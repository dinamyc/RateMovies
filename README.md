
# RateMovies App

This project is a movie rating application that displays the Top Rated Movies from The Movie Database (TMDb) and shows their details. The application uses the MVVM architecture and adheres to best practices for clean and maintainable code.

## Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [UI Design](#ui-design)
- [Best Practices](#best-practices)
- [References](#references)

## Features
- Displays the Top Rated Movies in a `UITableView`.
- Infinite scrolling to load more movies as the user scrolls down.
- Detailed view for each movie with title, poster image, description, release date, and rating.
- Native service consumption without using external frameworks or pods.
- Custom font and color palette usage.
- Simulated actions such as buttons, links, and modals for user interactions.

## Architecture
The application follows the Model-View-ViewModel (MVVM) architecture pattern. Below is a brief overview of each component:

### Model
- Represents the data and business logic.
- Structures data received from the network and prepares it for the ViewModel.

### ViewModel
- Acts as an intermediary between the Model and the View.
- Contains the logic to fetch data from the Model and exposes it to the View.
- Updates the View when the data changes.

### View
- Displays the data and responds to user interactions.
- Binds to the ViewModel to receive updates and display data.

## Getting Started
### Prerequisites
- Register on [The Movie Database (TMDb)](https://www.themoviedb.org/) and get an API key.
- Xcode installed on your Mac.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/dinamyc/RateMovies.git
   cd RateMovies
   ```

2. Open the project in Xcode:
   ```bash
   open RateMovies.xcodeproj
   ```

3. Add your TMDb API key in the project:
   ```swift
   let apiKey = "YOUR_API_KEY"
   ```

4. Build and run the project on your simulator or device.

## Usage
- The main screen displays the Top Rated Movies in a `UITableView`.
- Scroll down to load more movies.
- Tap on a movie to see its details.
- Interact with buttons and links to see simulated actions.

## UI Design
- Custom font added to the project.
- Color palette defined in the code and used across the app.

### Color Palette
- Primary Color: #ColorCode
- Secondary Color: #ColorCode
- Accent Color: #ColorCode

### Custom Font
- FontName-Regular.ttf

## Best Practices
- Follow the MVVM architecture to separate concerns and improve code maintainability.
- Use reusable components to reduce redundancy.
- Keep the ViewModel free of UIKit dependencies.
- Use dependency injection to improve testability.
- Follow coding standards and guidelines for consistency.

## References
- [Getting Started with TMDb API](https://developer.themoviedb.org/reference/intro/getting-started)
- [TMDb Top Rated Movies API](https://developer.themoviedb.org/reference/movie-top-rated-list)
