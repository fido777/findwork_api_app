import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:findwork_api_app/model/bokes.dart';
import 'package:findwork_api_app/model/local_job.dart';
// import 'package:html/parser.dart' show parse;
import 'package:flutter_html/flutter_html.dart';


class JobDetailsPage extends StatefulWidget {
  final LocalJob localJob;
  final bool showFloatingActionButton;

  const JobDetailsPage(
      {super.key,
      required this.localJob,
      required this.showFloatingActionButton});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  final Box<LocalJob> _hiveBox = Boxes.localJobsBox;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _isSaved = _hiveBox.containsKey(widget.localJob.id);
  }

  void _saveJob() {
    setState(() {
      if (!_isSaved) {
        _hiveBox.put(widget.localJob.id, widget.localJob);
        _isSaved = !_isSaved;
        // Eliminar snackbars antes de mostrar el siguiente
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trabajo guardado en favoritos.'),
          ),
        );
      } else {
        // Eliminar snackbars antes de mostrar el siguiente
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El trabajo ya está en favoritos.'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      floatingActionButton: widget.showFloatingActionButton
          ? FloatingActionButton.extended(
              onPressed: () {
                _saveJob();
              },
              label: const Text('Add to Favorites'),
              icon: const Icon(Icons.favorite_border),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.localJob.role,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.localJob.location,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.laptop_chromebook_rounded),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.localJob.companyName,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Html(
                data: widget.localJob.text,
                style: {
                  "body": Style(
                    fontSize: FontSize(16.0),
                  ),
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
