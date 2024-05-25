import 'package:flutter/material.dart';

import '../../domain/entities/job_entity.dart';

class JobItem extends StatelessWidget {
  final JobEntity model;

  const JobItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(model.imageUrl),
      title: Text(model.description),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${model.date}'),
          Text('Expiration Date: ${model.expirationDate}'),
        ],
      ),
    );
  }
}
