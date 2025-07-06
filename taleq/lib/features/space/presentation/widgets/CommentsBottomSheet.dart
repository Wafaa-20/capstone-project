import 'package:flutter/material.dart';

class CommentsBottomSheet extends StatelessWidget {
  final List<Map<String, dynamic>> comments;
  const CommentsBottomSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'التعليقات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index]['user'].toString()),
                  subtitle: Text(comments[index]['message'].toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
