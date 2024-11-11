import 'package:findwork_api_app/model/bokes.dart';
import 'package:findwork_api_app/model/local_job.dart';
import 'package:findwork_api_app/pages/job_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavoritesPage extends StatelessWidget {
  final String title;

  const FavoritesPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<LocalJob>>(
        valueListenable: Boxes.localJobsBox.listenable(),
        builder: (context, box, _) {
          final List<LocalJob> localJobs = box.values.toList().cast<LocalJob>();

          if (localJobs.isEmpty) {
            return const Center(
                child: Text('No hay trabajos guardados en favoritos.'));
          }

          return ListView.builder(
            itemCount: localJobs.length,
            itemBuilder: (context, index) {
              final localJob = localJobs[index];
              return JobCard(job: localJob, showFloatingActionButton: false,);
            },
          );
        },
      ),
    );
  }
}
