import 'dish_models.dart';

class NutritionAnalysis {
  final String dishName;
  final List<String> ingredients;
  final BasicNutrition nutritionInfo;
  final String? servingSize;
  final String? cookingInstructions;
  final String? mealType;
  final double confidence;

  const NutritionAnalysis({
    required this.dishName,
    required this.ingredients,
    required this.nutritionInfo,
    this.servingSize,
    this.cookingInstructions,
    this.mealType,
    this.confidence = 1.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'dishName': dishName,
      'ingredients': ingredients,
      'nutritionInfo': nutritionInfo.toJson(),
      'servingSize': servingSize,
      'cookingInstructions': cookingInstructions,
      'mealType': mealType,
      'confidence': confidence,
    };
  }

  factory NutritionAnalysis.fromJson(Map<String, dynamic> json) {
    return NutritionAnalysis(
      dishName: json['dishName'] as String,
      ingredients: (json['ingredients'] as List<dynamic>).cast<String>(),
      nutritionInfo: BasicNutrition.fromJson(
        json['nutritionInfo'] as Map<String, dynamic>,
      ),
      servingSize: json['servingSize'] as String?,
      cookingInstructions: json['cookingInstructions'] as String?,
      mealType: json['mealType'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
    );
  }
}
