import 'package:flutter/material.dart';

import '../../domain/entities/job_entity.dart';

class UserJobItem extends StatelessWidget {
  final JobEntity model;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const UserJobItem(
      {Key? key,
      required this.model,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
