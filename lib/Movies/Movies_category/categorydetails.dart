import 'package:flutter/material.dart';
import '../../Api/api_listsmovies.dart';
import '../../Theme/mytheme.dart';
import '../../model/Lists_movies_model.dart';
import 'categoryitem.dart';

class Category_details extends StatefulWidget {
  @override
  State<Category_details> createState() => _Category_detialsState();
}

class _Category_detialsState extends State<Category_details> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieGenre>>(
      future: ApiMoviesLists.fetchGenres(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final genre = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryItem(categoryId: genre.id,categoryName: genre.name,),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/category.png",
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: Text(
                        genre.name,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor,fontSize: 25),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.whiteColor,
              color: MyTheme.yellowColor,
            ),
          );
        }
      },
    );
  }
}
