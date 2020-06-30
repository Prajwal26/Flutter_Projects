import 'package:flutter/cupertino.dart';
import 'package:dailynewsapp/model/CategoryModel.dart';
List<CategoryModel> getCategories()
{
  List<CategoryModel> category=new List<CategoryModel>();
  CategoryModel categoryModel;

  //1
  categoryModel=new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1462899006636-339e08d1844e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="General";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1472289065668-ce650ac443d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Health";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1507668077129-56e32842fceb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;
}