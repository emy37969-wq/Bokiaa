

// class Slidermodel {
//   final String image;

//   Slidermodel({required this.image});

//   factory Slidermodel.fromJson(Map<String, dynamic> json) {
//     return Slidermodel(
//       image: json['image'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//     };
//   }
// }

// class SliderResponse {
//   final List<Slidermodel> sliders;
//   final String message;
//   final List<dynamic> error;
//   final int status;

//   SliderResponse({
//     required this.sliders,
//     required this.message,
//     required this.error,
//     required this.status,
//   });

//   factory SliderResponse.fromJson(Map<String, dynamic> json) {
//     var slidersList = (json['data']['sliders'] as List)
//         .map((item) => Slidermodel.fromJson(item))
//         .toList();

//     return SliderResponse(
//       sliders: slidersList,
//       message: json['message'] ?? '',
//       error: json['error'] ?? [],
//       status: json['status'] ?? 0,
//     );
//   }


//   Map<String, dynamic> toJson() {
//     return {
//       'data': {
//         'sliders': sliders.map((s) => s.toJson()).toList(),
//       },
//       'message': message,
//       'error': error,
//       'status': status,
//     };
//   }
// }


class SliderModel {
  SliderData? data;
  String? message;
  int? status;

  SliderModel({this.data, this.message, this.status});

  SliderModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SliderData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class SliderData {
  List<SliderImages>? sliders;
  SliderData({this.sliders});

  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderImages>[];
      json['sliders'].forEach((v) {
        sliders!.add(SliderImages.fromJson(v));
      });
    }
  }
}

class SliderImages {
  String? image;
  SliderImages({this.image});
  SliderImages.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}