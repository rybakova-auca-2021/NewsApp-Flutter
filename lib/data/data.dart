import 'package:news_app/model/category_model.dart';

const categoriesList = [
  CategoryModel(name: "Business", image: "images/business.jpg"),
  CategoryModel(name: "Entertainment", image: "images/entertainment.jpeg"),
  CategoryModel(name: "General", image: "images/general.jpg"),
  CategoryModel(name: "Health", image: "images/health.jpeg"),
  CategoryModel(name: "Science", image: "images/science.jpeg"),
  CategoryModel(name: "Sport", image: "images/sport.jpg"),
];

List<CategoryModel> getCategories() {
  return categoriesList;
}
