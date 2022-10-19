import 'package:flutter/material.dart';
import '../dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: ((context, index) => Card(
                      // color: Colors.pink,
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(selectedMeal.ingredients[index]),
                    )),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                context,
                ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('#${(index + 1)}'),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            Divider()
                          ],
                        )))
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget listViewChild) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.23,
      child: listViewChild,
    );
  }
}
