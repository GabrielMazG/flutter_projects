import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (typeText.isNotEmpty)
                          Text(
                            typeText,
                            style: const TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  String get typeText {
    if (!meal.isGlutenFree &&
        !meal.isLactoseFree &&
        !meal.isVegetarian &&
        !meal.isVegan) {
      return "";
    }
    String type = '';
    if (meal.isGlutenFree) type = '/ GlutenFree';
    if (meal.isLactoseFree) type = '$type / LactoseFree';
    if (meal.isVegetarian) type = '$type / Vegetarian';
    if (meal.isVegan) type = '$type / Vegan';
    return '$type /';
  }
}
