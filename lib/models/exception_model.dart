class ExceptionModel {
  final bool? status;
  final String? message;
  const ExceptionModel({this.message, this.status});

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
