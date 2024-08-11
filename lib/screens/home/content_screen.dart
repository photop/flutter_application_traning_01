import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_traning_01/models/content_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_traning_01/config/app.dart';


class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  Future<List<ContentModel>> fetchContent() async {
    try {
      final response =
          await http.get(Uri.parse('$API_URL/api/content-for-cmru-app.json'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map<ContentModel>((data) => ContentModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to load content: ${response.statusCode}');
      }
    } catch (e) {
      // Print the error to the console for debugging
      print('Error fetching content: $e');
      // Throw a generic exception to be caught by the FutureBuilder
      throw Exception('Failed to load content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแสดงบทความ'),
      ),
      body: FutureBuilder<List<ContentModel>>(
        future: fetchContent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        snapshot.data![index].thumbnail,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          snapshot.data![index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}