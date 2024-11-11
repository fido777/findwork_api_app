import 'package:findwork_api_app/model/local_job.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LocalJob> get localJobsBox => Hive.box<LocalJob>('local_jobs');
}
