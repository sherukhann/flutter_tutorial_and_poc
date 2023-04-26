import 'dart:convert';

import 'package:flutter/material.dart';

import 'app_button.dart';
import 'base_client.dart';
import 'post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API call'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(
                size: 72,
              ),
              AppButton(
                operation: 'GET',
                description: 'Fetch Posts',
                operationColor: Colors.lightGreen,
                onPressed: () async {
                  var response =
                      await BaseClient().get('/posts').catchError((err) {});
                  if (response == null) return;

                  var posts = postFromJson(response);
                  debugPrint('GET SUCCESSFUL : Posts length : ${posts.length}');
                },
              ),
              AppButton(
                operation: 'POST',
                description: 'Add Post',
                operationColor: Colors.lightBlue,
                onPressed: () async {
                  var post = Post(
                      title: 'parent app',
                      body: 'we are learning flutter for parent app');
                  var response = await BaseClient()
                      .post('/posts', post)
                      .catchError((err) {});
                  if (response == null) return;

                  var newPost = json.decode(response);
                  debugPrint('POST SUCCESSFUL : $newPost');
                },
              ),
              AppButton(
                operation: 'PUT',
                description: 'Edit Post',
                operationColor: Colors.orangeAccent,
                onPressed: () async {
                  var id = 2;
                  var post = Post(
                      title: 'parent app 2',
                      body: 'we are learning flutter for parent app');
                  var response = await BaseClient()
                      .put('/posts/$id', post)
                      .catchError((err) {debugPrint('$err');});
                  if (response == null) return;

                  var updatedPost = json.decode(response);
                  debugPrint('PUT SUCCESSFUL : $updatedPost');
                },
              ),
              AppButton(
                operation: 'DELETE',
                description: 'Delete Post',
                operationColor: Colors.red,
                onPressed: () async {
                  var id = 2;
                  var response = await BaseClient()
                      .delete('/posts/$id')
                      .catchError((err) {
                    debugPrint('$err');
                  });
                  if (response == null) return;
                  var deletedPost = json.decode(response);
                  debugPrint('DELETE SUCCESSFUL : $deletedPost');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


// flutter: GET SUCCESSFUL : Posts length : 100
// flutter: POST SUCCESSFUL : {title: parent app, body: we are learning flutter for parent app, id: 101}
// flutter: PUT SUCCESSFUL : {title: parent app 2, body: we are learning flutter for parent app, id: 2}
// flutter: DELETE SUCCESSFUL : {}