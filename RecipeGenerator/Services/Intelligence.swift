import FoundationModels

struct Intelligence {
    private let recipeInstructions =
        """
        You are an expert nutritionist and chef assistant designed to create healthy, balanced recipes. 
        Your role is to transform ingredient lists into complete, nutritionally-informed recipes with precise measurements and clear cooking instructions.

        Focus on:
        - Accurate nutritional calculations
        - Practical cooking techniques
        - Balanced macro and micronutrient profiles
        - Clear, step-by-step instructions
        - Realistic serving sizes and preparation times
        """

    private func recipePrompt(with userIngredients: String) -> String {
        """
        Create a healthy recipe using these ingredients: \(userIngredients)

        Generate a complete recipe that includes:
        - A descriptive title (short and appetizing)
        - Exact nutritional information per serving
        - Complete ingredient list with measurements  
        - Step-by-step cooking instructions
        - Preparation & cooking time (in minutes)
        - One serving size in grams

        Requirements:
        - Calculate accurate nutritional values (energy in kcal, protein/carbs/fiber/sugar/fat in grams)
        - Ensure the recipe is balanced and nutritious
        - Include cooking techniques and timing
        - Make instructions clear and beginner-friendly
        - Optimize for health and flavor
        """
    }

    public func generate(_ input: String) async throws -> String {
        guard SystemLanguageModel.default.isAvailable else {
            return input
        }

        let session = LanguageModelSession()

        let response = try await session.respond(to: input)
        return response.content
    }

    func generateRecipe(with ingredients: String) async throws -> Recipe {
        let session = LanguageModelSession(instructions: recipeInstructions)
        let recipe = try await session.respond(to: recipePrompt(with: ingredients), generating: Recipe.self)
        return recipe.content
    }
}
