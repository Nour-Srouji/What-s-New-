import 'package:collection/collection.dart';

import 'job_entity.dart';

abstract class JobsEntity {
  final List<JobEntity> jobs;

  JobsEntity(this.jobs);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobsEntity &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(jobs, other.jobs);

  @override
  int get hashCode => jobs.hashCode;

  @override
  String toString() {
    return 'JobsEntity{jobs: $jobs}';
  }
}
