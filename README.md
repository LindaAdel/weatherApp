# weatherApp
 weather app is a SwiftUI app that follows the VIP Clean Architecture pattern with dependency injection and combine . It provides examples of using presenters, interactors, models, data wrapper models, and a repository pattern with Alamofire for network requests. The app also includes CLLocationManager, DateManager, and other relevant components in addition to unit testing .

 the app consists of a screen that represents the weather for the current date with its information and a 5 day forecast list with the minimun aand maximum Temperature in the  day .

---
# Architecture Overview
The app follows the VIP Clean Architecture pattern, which stands for View, Interactor, Presenter (VIP). The core principle of this architecture is separation of concerns and dependency inversion.

---
# Components:
View: SwiftUI views responsible for rendering the user interface and handling user interactions. They receive updates from the presenter and send user actions to the presenter.

- Presenter:
  Acts as an intermediary between the view and the interactor. It receives user actions from the view, processes them, and updates the view with the necessary data.

- Interactor:
 Contains the business logic of the app. It communicates with data wrapper models, CLLocationManager, DateManager, and repositories to fetch and process data. It interacts   with the presenter to provide the necessary data for the view.

- Models:
  The app's data models that represent the entities and structures used in the app.

- Data Wrapper Models:
  Models that encapsulate the data received from external sources, such as APIs or databases.

- Repository:
  Handles data retrieval and persistence. It abstracts the details of data sources and provides a clean interface for the interactor to work with. In this app, the  repository uses Alamofire for network requests.

- Dependency Injection:
   The app utilizes dependency injection to decouple components and manage dependencies. It uses a property wrapper @Inject annotation and a DI container with an assembler to provide dependencies to the necessary components.
  
- Combine:
  The app uses Combine, Apple's framework for reactive programming, to handle data transport and asynchronous operations. Combine provides a declarative way to handle asynchronous events, such as network requests and data updates.
---
# Installation
To run the app:

Clone the repository.
pod install.
Open the project in Xcode.
Build and run the app on a simulator or physical device.

---
# Usage
The app showcases a sample feature that demonstrates the flow between view, presenter, interactor, CLLocationManager, DateManager, and repository. 

---
# CLLocationManager
The app utilizes CLLocationManager to access the device's location and retrieve the country code. The CLLocationManager instance is managed by the LocationManager class. The LocationManager class conforms to the CLLocationManagerDelegate protocol and handles location-related events with a shared instance .

---
# DateManager
The app includes a DateManager class that provides utility methods for manipulating dates and performing date-related operations. It can be used to format dates, get current date with a shared instance.

---
# Unit Testing
The app includes unit tests for its components.

---
# Dependencies
The app uses the following dependencies:

Alamofire: A Swift-based HTTP networking library for making network requests.
These dependencies are managed using Swift Package Manager and are included in the project.

---
# Acknowledgements
Alamofire for providing a powerful networking library.
SwiftUI for the declarative approach to building user interfaces.
VIP Clean Architecture for the architectural pattern used in the app.
