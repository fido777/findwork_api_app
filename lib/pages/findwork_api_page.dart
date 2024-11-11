import 'package:findwork_api_app/model/findwork_api_response.dart';
import 'package:findwork_api_app/model/local_job.dart';
import 'package:findwork_api_app/pages/job_card.dart';
import 'package:findwork_api_app/repository/findwork_api_call.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class FindworkApiPage extends StatefulWidget {
  const FindworkApiPage({super.key, required this.title});

  final String title;

  @override
  State<FindworkApiPage> createState() => _FindworkApiPageState();
}

class _FindworkApiPageState extends State<FindworkApiPage> {
  List<JobApiResponse> jobsList = <JobApiResponse>[];

  Future<void> _getFindworkJobs() async {
    final FindworkApiResponse apiResponse = await FindworkApiCall.fetchJobs();
    setState(() {
      jobsList = apiResponse.results;
      log(jobsList.first.datePosted, name: 'datePosted', level: 200);
    });
  }

  @override
  void initState() {
    super.initState();
    _getFindworkJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar with the title centered
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: jobsList.length,
        itemBuilder: (context, index) {
          final JobApiResponse job = jobsList[index];
          return JobCard(job: job.toLocalJob(), showFloatingActionButton: true,);
        },
      ),
    );
  }
}

