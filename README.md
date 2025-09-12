# RecipeGenerator

An iOS application built with SwiftUI that uses a local AI model to generate personalized recipes from a list of ingredients.

## 🎬 Demo

*A video showcasing the app in action will be added here soon.*

## 🌟 Features

*   **AI-Powered Recipes:** Enter the ingredients you have, and the app will generate a complete recipe for you.
*   **Detailed Nutrition:** Get a full breakdown of nutritional information for each recipe, including calories, protein, fat, and carbs.
*   **Step-by-Step Instructions:** Clear, easy-to-follow cooking steps.
*   **Time Estimates:** Know the total preparation and cooking time.
*   **Sleek & Animated UI:** A modern and responsive interface built with SwiftUI, featuring smooth animations for a great user experience.
*   **State Management:** The UI gracefully handles idle, loading, success, and error states.

## 🙏 Inspiration

This project was inspired by the article "[Building AI features using Foundation Models. Structured content.](https://swiftwithmajid.com/2025/08/26/building-ai-features-using-foundation-models-structured-content/)" by Majid Jabrayilov.

## 🛠️ How It Works

The application is built entirely with **SwiftUI**. It leverages Apple's `FoundationModels` framework to run a local large language model on-device. This model is prompted with user-provided ingredients and a set of instructions to generate a structured `Recipe` object.

The main view (`ContentView`) manages the application's state (`GeneratingState`), switching between different sub-views:
*   `IdleStateView`: The initial screen where the user enters ingredients.
*   `GeneratingStateView`: A loading screen with animations shown while the recipe is being created.
*   `RecipeDetailView`: Displays the generated recipe with all its details.
*   `ErrorStateView`: Shown if the AI model fails to generate a recipe.

## 📂 Project Structure

```
RecipeGenerator/
├── Models/
│   └── Recipe.swift        # The data model for a recipe
├── Modules/
│   ├── Idle/               # UI for the initial state
│   ├── Generating/         # UI for the loading state
│   ├── Recipe/             # UI for displaying the recipe
│   └── Error/              # UI for the error state
├── Services/
│   └── Intelligence.swift  # Handles interaction with the AI model
├── Shared/
│   ├── Components/         # Reusable UI components
│   └── State/              # Application state management
└── ContentView.swift       # The main view of the app
```

## 📋 Requirements

This application uses Apple's on-device `FoundationModels` for AI capabilities. Therefore, it can only run on devices that support this feature:

*   **iPhone:** iPhone 15 Pro / Pro Max and newer (with A17 Pro chip or later).

## 🚀 Getting Started

1.  Open `RecipeGenerator.xcodeproj` in Xcode.
2.  Select an iOS simulator or a connected device that meets the requirements above.
3.  Build and run the project (Cmd+R).
