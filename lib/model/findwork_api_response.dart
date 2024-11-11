import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart' show ValueGetter, listEquals;
import 'package:flutter/foundation.dart';

class FindworkApiResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<JobApiResponse> results;
  FindworkApiResponse({
    this.count = 0,
    this.next,
    this.previous,
    this.results = const <JobApiResponse>[],
  });

  FindworkApiResponse copyWith({
    int? count,
    ValueGetter<String?>? next,
    ValueGetter<String?>? previous,
    List<JobApiResponse>? results,
  }) {
    return FindworkApiResponse(
      count: count ?? this.count,
      next: next != null ? next() : this.next,
      previous: previous != null ? previous() : this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory FindworkApiResponse.fromMap(Map<String, dynamic> map) {
    return FindworkApiResponse(
      count: map['count']?.toInt() ?? 0,
      next: map['next'],
      previous: map['previous'],
      results: List<JobApiResponse>.from(
          map['results']?.map((x) => JobApiResponse.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FindworkApiResponse.fromJson(String source) {
    var findworkApiResponse = FindworkApiResponse.fromMap(json.decode(source));
    log(findworkApiResponse.results.first.toString(),
        name: 'FindworkApiResponse.fromJson', level: 200);
    return findworkApiResponse;
  }

  @override
  String toString() {
    return 'FindworkApiResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FindworkApiResponse &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

class JobApiResponse {
  final String id;
  final String role;
  final String companyName;
  final String? companyNumEmployees;
  final String? employmentType;
  final String? location;
  final bool remote;
  final String? logo;
  final String url;
  final String text;
  final String datePosted;
  final List<String> keywords;
  final String source;
  JobApiResponse({
    required this.id,
    required this.role,
    required this.companyName,
    this.companyNumEmployees,
    this.employmentType,
    this.location,
    required this.remote,
    this.logo,
    required this.url,
    required this.text,
    required this.datePosted,
    required this.keywords,
    required this.source,
  });

  JobApiResponse copyWith({
    String? id,
    String? role,
    String? companyName,
    ValueGetter<String?>? companyNumEmployees,
    ValueGetter<String?>? employmentType,
    String? location,
    bool? remote,
    ValueGetter<String?>? logo,
    String? url,
    String? text,
    String? datePosted,
    List<String>? keywords,
    String? source,
  }) {
    return JobApiResponse(
      id: id ?? this.id,
      role: role ?? this.role,
      companyName: companyName ?? this.companyName,
      companyNumEmployees: companyNumEmployees != null
          ? companyNumEmployees()
          : this.companyNumEmployees,
      employmentType:
          employmentType != null ? employmentType() : this.employmentType,
      location: location ?? this.location,
      remote: remote ?? this.remote,
      logo: logo != null ? logo() : this.logo,
      url: url ?? this.url,
      text: text ?? this.text,
      datePosted: datePosted ?? this.datePosted,
      keywords: keywords ?? this.keywords,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'company_name': companyName,
      'company_num_employees': companyNumEmployees,
      'employment_type': employmentType,
      'location': location,
      'remote': remote,
      'logo': logo,
      'url': url,
      'text': text,
      'date_posted': datePosted,
      'keywords': keywords,
      'source': source,
    };
  }

  factory JobApiResponse.fromMap(Map<String, dynamic> map) {
    return JobApiResponse(
      id: map['id'] ?? '',
      role: map['role'] ?? '',
      companyName: map['company_name'] ?? '',
      companyNumEmployees: map['company_num_employees'],
      employmentType: map['employment_type'],
      location: map['location'],
      remote: map['remote'] ?? false,
      logo: map['logo'],
      url: map['url'] ?? '',
      text: map['text'] ?? '',
      datePosted: map['date_posted'] ?? '',
      keywords: List<String>.from(map['keywords']),
      source: map['source'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JobApiResponse.fromJson(String source) =>
      JobApiResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobApiResponse(id: $id, role: $role, company_name: $companyName, company_num_employees: $companyNumEmployees, employment_type: $employmentType, location: $location, remote: $remote, logo: $logo, url: $url, text: $text, datePosted: $datePosted, keywords: $keywords, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JobApiResponse &&
        other.id == id &&
        other.role == role &&
        other.companyName == companyName &&
        other.companyNumEmployees == companyNumEmployees &&
        other.employmentType == employmentType &&
        other.location == location &&
        other.remote == remote &&
        other.logo == logo &&
        other.url == url &&
        other.text == text &&
        other.datePosted == datePosted &&
        listEquals(other.keywords, keywords) &&
        other.source == source;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        role.hashCode ^
        companyName.hashCode ^
        companyNumEmployees.hashCode ^
        employmentType.hashCode ^
        location.hashCode ^
        remote.hashCode ^
        logo.hashCode ^
        url.hashCode ^
        text.hashCode ^
        datePosted.hashCode ^
        keywords.hashCode ^
        source.hashCode;
  }
}
