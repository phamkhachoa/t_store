// import 'api_error.dart';
//
// abstract class ApiResponse<T> {
//   ApiResponse.fromJson(Map<String, dynamic>? json) {
//     if (json != null) {
//       Map<String, dynamic> map = Map();
//       map['code'] = json['code'];
//       map['message'] = json['message'];
//
//       error = ApiError.fromJson(map);
//       if (json['data'] != null && json['data'] is Map<String, dynamic>) {
//         data = json['data'] != null ? jsonToData(json['data'] as Map<String, dynamic>) : null;
//       } else if (json['data'] != null && json['data'] is T) {
//         data = json['data'] as T?;
//       } else {
//         data = null;
//       }
//     }
//   }
//
//   ApiError? error;
//   T? data;
//
//   T? jsonToData(Map<String, dynamic> fullJson);
//
//   dynamic dataToJson(T? data);
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//
//     data['error'] = error?.toJson();
//     data['data'] = dataToJson(this.data);
//     return data;
//   }
// }
//
// abstract class ListApiResponse<T> {
//   ListApiResponse.fromJson(Map<String, dynamic> json) {
//     Map<String, dynamic> map = Map();
//     map['code'] = json['code'];
//     map['message'] = json['message'];
//
//     error = json['error'] == null ? null : ApiError.fromJson(map);
//     data = json['data'] != null ? jsonToData(json['data']) : null;
//   }
//
//   ApiError? error;
//   List<T>? data;
//
//   List<T> jsonToData(List<dynamic> fullJson);
//
//   dynamic dataToJson(List<T>? data);
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//
//     data['error'] = error?.toJson();
//     data['data'] = dataToJson(this.data);
//     return data;
//   }
// }
//
// abstract class PageApiResponse<T> {
//   PageApiResponse.fromJson(Map<String, dynamic> json) {
//     Map<String, dynamic> map = Map();
//     map['code'] = json['code'];
//     map['message'] = json['message'];
//
//     error = json['error'] == null ? null : ApiError.fromJson(map);
//     var data = json['data'];
//     if (data != null && data is Map<String, dynamic>) {
//       isFirstPage = data['isFirstPage'];
//       isLastPage = data['isLastPage'];
//       nbItems = data['nbItems'];
//       pageNumber = data['pageNumber'];
//       pageSize = data['pageSize'];
//       powerConsumption = data['powerConsumption'];
//       if (data['sort'] != null) {
//         sort = List.empty(growable: true);
//         data['sort'].forEach((v) {
//           sort?.add(Sort.fromJson(v));
//         });
//       }
//       totalItems = data['totalItems'];
//       totalPages = data['totalPages'];
//       items = data['items'] != null ? jsonToData(data['items']) : null;
//     }
//   }
//
//   ApiError? error;
//   List<T>? items;
//   bool? isFirstPage;
//   bool? isLastPage;
//   int? nbItems;
//   int? pageNumber;
//   int? pageSize;
//   int? powerConsumption;
//   List<Sort>? sort;
//   int? totalItems;
//   int? totalPages;
//
//   List<T> jsonToData(List<dynamic> fullJson);
//
//   dynamic dataToJson(List<T>? data);
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     final Map<String, dynamic> childData = Map<String, dynamic>();
//     childData['isFirstPage'] = this.isFirstPage;
//     childData['isLastPage'] = this.isLastPage;
//     childData['nbItems'] = this.nbItems;
//     childData['pageNumber'] = this.pageNumber;
//     childData['pageSize'] = this.pageSize;
//     childData['powerConsumption'] = this.powerConsumption;
//     if (this.sort != null) {
//       childData['sort'] = this.sort?.map((v) => v.toJson()).toList();
//     }
//     childData['totalItems'] = this.totalItems;
//     childData['totalPages'] = this.totalPages;
//     childData['items'] = dataToJson(this.items);
//     data['error'] = error?.toJson();
//     data['data'] = childData;
//
//     return data;
//   }
// }
//
// abstract class PageApiResponse2<T> {
//   PageApiResponse2.fromJson(Map<String, dynamic> json) {
//     Map<String, dynamic> map = Map();
//     map['code'] = json['code'];
//     map['message'] = json['message'];
//
//     error = json['error'] == null ? null : ApiError.fromJson(map);
//     var data = json['data'];
//     if (data != null && data is Map<String, dynamic>) {
//       isFirstPage = data['isFirstPage'];
//       isLastPage = data['isLastPage'];
//       nbItems = data['nbItems'];
//       page = data['pageN'];
//       limit = data['limit'];
//       powerConsumption = data['powerConsumption'];
//       if (data['sort'] != null) {
//         sort = List.empty(growable: true);
//         data['sort'].forEach((v) {
//           sort?.add(Sort.fromJson(v));
//         });
//       }
//       count = data['count'];
//       totalPage = data['totalPage'];
//       rows = data['rows'] != null ? jsonToData(data['rows']) : null;
//     }
//   }
//
//   ApiError? error;
//   List<T>? rows;
//   bool? isFirstPage;
//   bool? isLastPage;
//   int? nbItems;
//   int? page;
//   int? limit;
//   int? powerConsumption;
//   List<Sort>? sort;
//   int? count;
//   int? totalPage;
//
//   List<T> jsonToData(List<dynamic> fullJson);
//
//   dynamic dataToJson(List<T>? data);
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     final Map<String, dynamic> childData = Map<String, dynamic>();
//     childData['isFirstPage'] = this.isFirstPage;
//     childData['isLastPage'] = this.isLastPage;
//     childData['nbItems'] = this.nbItems;
//     childData['page'] = this.page;
//     childData['limit'] = this.limit;
//     childData['powerConsumption'] = this.powerConsumption;
//     if (this.sort != null) {
//       childData['sort'] = this.sort?.map((v) => v.toJson()).toList();
//     }
//     childData['count'] = this.count;
//     childData['totalPage'] = this.totalPage;
//     childData['rows'] = dataToJson(this.rows);
//     data['error'] = error?.toJson();
//     data['data'] = childData;
//
//     return data;
//   }
// }
//
// class SimpleResponse extends ApiResponse<String> {
//   SimpleResponse.fromJson(Map<String, dynamic>? json) : super.fromJson(json);
//
//   @override
//   dynamic dataToJson(String? data) {
//     return data;
//   }
//
//   @override
//   String? jsonToData(Map<String, dynamic>? fullJson) {
//     return fullJson?.toString();
//   }
//
//   int? get code => error?.code;
// }
//
// class SimpleListResponse extends ListApiResponse<String> {
//   SimpleListResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
//
//   @override
//   dataToJson(List<String>? data) {
//     List<String> listData = <String>[];
//     data?.forEach((element) {
//       listData.add(element);
//     });
//     return listData;
//   }
//
//   @override
//   List<String> jsonToData(List fullJson) {
//     List<String> listData = <String>[];
//     fullJson.forEach((element) {
//       listData.add(element);
//     });
//     return listData;
//   }
// }
//
// class Sort {
//   String? direction;
//   String? property;
//
//   Sort({this.direction, this.property});
//
//   Sort.fromJson(Map<String, dynamic> json) {
//     direction = json['direction'];
//     property = json['property'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['direction'] = this.direction;
//     data['property'] = this.property;
//     return data;
//   }
// }
