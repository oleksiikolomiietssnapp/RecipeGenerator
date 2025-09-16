import Foundation
import FoundationModels

@Generable
struct Recipe: Equatable {
    @Guide(description: "A short, descriptive recipe title without numbers or serving counts.")
    let title: String

    @Guide(description: "Total energy per serving, measured in kilocalories (kcal).")
    let energy: Double

    @Guide(description: "Total protein content per serving, measured in grams (g).")
    let protein: Double

    @Guide(description: "Total carbohydrate content per serving, measured in grams (g).")
    let carbs: Double

    @Guide(description: "Total dietary fiber content per serving, measured in grams (g).")
    let fiber: Double

    @Guide(description: "Total sugar content per serving, measured in grams (g).")
    let sugar: Double

    @Guide(description: "Total fat content per serving, measured in grams (g).")
    let fatTotal: Double

    @Guide(description: "Total saturated fat content per serving, measured in grams (g).")
    let fatSaturated: Double

    @Guide(description: "Serving size, measured as the total weight of one portion in grams (g).")
    let servingSize: Double

    @Guide(description: "List of ingredients with quantities, separated by commas.")
    let ingredients: String?

    @Guide(
        description:
            "Cooking instructions written as plain sentences, separated by periods, without step numbers. Add time to cook to each instruction and a total time at the end."
    )
    let steps: String?
}
