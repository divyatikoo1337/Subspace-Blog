import 'package:blog/components/blog_item.dart';
import 'package:blog/models/Blog.dart';
import 'package:blog/screens/blog_details_screen.dart';
import 'package:blog/screens/error_screen.dart';
import 'package:blog/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogScreen extends StatefulWidget {
  BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  var blogs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBlogs();
  }

  void fetchBlogs() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        List<dynamic> blogData = responseData['blogs'];

        // Assign the extracted blogs to the class-level variable
        List<dynamic> blogsList = blogData.map((data) {
          return Blog(
            url: data['image_url'] ?? '',
            heading: data['title'] ?? '',
            description: '',
          );
        }).toList();

        // Update the widget after setting the blogsList
        setState(() {
          blogs = blogsList;
        });
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      ErrorPage(error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(blogs);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Sub-Space Blogs",
          style: TextStyle(color: Theme.of(context).backgroundColor),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Theme.of(context).primaryColor,
            height: 700,
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: ((context, index) => InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogDetailsScreen(
                                    blog: blogs[index],
                                    index: index,
                                  )),
                        )),
                    child: BlogItem(
                      blog: blogs[index],
                    ),
                  )),
            )),
      ),
    );
  }
}
