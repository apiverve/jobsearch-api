/// Response models for the Job Search API.

/// API Response wrapper.
class JobsearchResponse {
  final String status;
  final dynamic error;
  final JobsearchData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  JobsearchResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory JobsearchResponse.fromJson(Map<String, dynamic> json) => JobsearchResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JobsearchData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Job Search API.

class JobsearchData {
  num? page;
  num? count;
  bool? hasMore;
  List<JobsearchDataJobsItem>? jobs;

  JobsearchData({
    this.page,
    this.count,
    this.hasMore,
    this.jobs,
  });

  factory JobsearchData.fromJson(Map<String, dynamic> json) => JobsearchData(
      page: json['page'],
      count: json['count'],
      hasMore: json['hasMore'],
      jobs: (json['jobs'] as List?)?.map((e) => JobsearchDataJobsItem.fromJson(e)).toList(),
    );
}

class JobsearchDataJobsItem {
  String? id;
  String? title;
  String? company;
  String? location;
  List<String>? locations;
  String? country;
  bool? remote;
  String? workplaceType;
  String? employmentType;
  String? postedAt;
  String? url;
  String? applyUrl;
  JobsearchDataJobsItemSalary? salary;

  JobsearchDataJobsItem({
    this.id,
    this.title,
    this.company,
    this.location,
    this.locations,
    this.country,
    this.remote,
    this.workplaceType,
    this.employmentType,
    this.postedAt,
    this.url,
    this.applyUrl,
    this.salary,
  });

  factory JobsearchDataJobsItem.fromJson(Map<String, dynamic> json) => JobsearchDataJobsItem(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      locations: (json['locations'] as List?)?.cast<String>(),
      country: json['country'],
      remote: json['remote'],
      workplaceType: json['workplaceType'],
      employmentType: json['employmentType'],
      postedAt: json['postedAt'],
      url: json['url'],
      applyUrl: json['applyUrl'],
      salary: json['salary'] != null ? JobsearchDataJobsItemSalary.fromJson(json['salary']) : null,
    );
}

class JobsearchDataJobsItemSalary {
  dynamic min;
  dynamic max;
  dynamic currency;
  dynamic interval;

  JobsearchDataJobsItemSalary({
    this.min,
    this.max,
    this.currency,
    this.interval,
  });

  factory JobsearchDataJobsItemSalary.fromJson(Map<String, dynamic> json) => JobsearchDataJobsItemSalary(
      min: json['min'],
      max: json['max'],
      currency: json['currency'],
      interval: json['interval'],
    );
}

class JobsearchRequest {
  String keyword;
  String? location;
  String? country;
  bool? remote;
  String? employmentType;
  String? postedSince;
  String? company;
  double? minSalary;
  int? page;

  JobsearchRequest({
    required this.keyword,
    this.location,
    this.country,
    this.remote,
    this.employmentType,
    this.postedSince,
    this.company,
    this.minSalary,
    this.page,
  });

  Map<String, dynamic> toJson() => {
      'keyword': keyword,
      if (location != null) 'location': location,
      if (country != null) 'country': country,
      if (remote != null) 'remote': remote,
      if (employmentType != null) 'employmentType': employmentType,
      if (postedSince != null) 'postedSince': postedSince,
      if (company != null) 'company': company,
      if (minSalary != null) 'minSalary': minSalary,
      if (page != null) 'page': page,
    };
}
