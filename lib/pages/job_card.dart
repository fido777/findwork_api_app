import 'package:flutter/material.dart';
import 'package:findwork_api_app/model/bokes.dart';
import 'package:findwork_api_app/model/local_job.dart';
import 'package:findwork_api_app/pages/job_detail_page.dart';

class JobCard extends StatelessWidget {
  final LocalJob job;

  final bool showFloatingActionButton;

  const JobCard(
      {super.key, required this.job, required this.showFloatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Navegar al detalle del trabajo
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobDetailsPage(
                localJob: job,
                showFloatingActionButton: showFloatingActionButton,
              ),
            ),
          );
        },
        onLongPress: () => {_showRemoveConfirmationDialog(context)},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.role,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.laptop_chromebook_rounded),
                          const SizedBox(width: 8.0),
                          Text(job.companyName),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const SizedBox(width: 8.0),
                          Text(job.isRemote ? 'Remoto' : 'Presencial'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.location_city),
                      const SizedBox(width: 8.0),
                      Text(job.location),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showRemoveConfirmationDialog(BuildContext context) async =>
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('¿Quitar de Favoritos?'),
            content: const Text(
              '¿Estás seguro de que deseas quitar este trabajo de tu lista de favoritos?',
              style: TextStyle(fontSize: 16.0),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Remover el trabajo del Hive Box
                  Boxes.localJobsBox.delete(job.id);
                  Navigator.of(context).pop(true);
                },
                child: const Text('Remove'),
              ),
            ],
          );
        },
      );
}
