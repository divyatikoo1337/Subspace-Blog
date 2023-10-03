import 'package:blog/components/blog_item.dart';
import 'package:blog/models/Blog.dart';
import 'package:blog/provider/favorite_provider.dart';
import 'package:blog/screens/blog_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    List<Blog> favorites = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Theme.of(context).primaryColor,
            height: 700,
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: ((context, index) => InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogDetailsScreen(
                                    blog: favorites[index],
                                    index: index,
                                  )),
                        )),
                    child: BlogItem(
                      blog: favorites[index],
                    ),
                  )),
            )),
      ),
    );
  }
}
