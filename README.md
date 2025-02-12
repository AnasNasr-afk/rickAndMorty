# **Rick and Morty App**

🚀 A Flutter app for practicing clean architecture and state management using Cubit.

## 📌 Overview

This app follows a clean architecture approach, separating data, business logic, and presentation layers.
It utilizes the Rick and Morty API to fetch and display character data, supports offline storage, and features smooth Flutter animations.

## 🏗 Architecture Used

This app follows a Clean Architecture pattern:

### 1️⃣ Data Layer 🗄️

Model: Represents data structures.
API Service: Fetches data using Dio.
Repository: Acts as an abstraction between data sources and business logic.
### 2️⃣ Business Logic Layer ⚙️

Uses Cubit (from flutter_bloc) to manage state and interact with the repository.
### 3️⃣ Presentation Layer 🎨

UI (Widgets & Screens) listens to Cubit for state updates.
lib/
│── data/             # Data Layer
│   ├── models/       # Data Models
│   ├── api_service/  # API calls (Dio)
│   ├── repository/   # Data Repository
│
│── business_logic/   # Business Logic Layer
│   ├── cubit/        # Cubit State Management
│
│── presentation/     # UI Layer
│   ├── screens/      # Screens & Widgets
│   ├── widgets/      # UI Components
│
│── main.dart         # App Entry Point

## 🚀 Features

✅ Fetch Data from API (Using Dio)
✅ State Management (Cubit)
✅ Flutter Offline (Connect to internet)
✅ Animations (Flutter Animation Package)
✅ Search & Filter Characters
✅ Dark Mode Support

## 📸 Screenshots

| Home Page | Character Details |
|-----------|------------------|
| <img src="homePage.png" width="150"> | <img src="characterDetails.png" width="150"> |


*Technology	Usage
Flutter 🖥️	UI Development
Dio 🌐	API Requests
Bloc/Cubit 🔄	State Management
Flutter Animation 🎬	Smooth UI Transitions
📸 Screenshots*

Home Page	Character Details

## 🛠 Future Enhancements

🔹 Unit Testing & Widget Testing




*That’s it! This README.md is now GitHub-ready 🚀. Let me know if you need any modifications! 🎯*
