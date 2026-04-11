import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Customnetwork extends StatelessWidget {
  final String imageurl;
  final double height;
  final double width;
  const Customnetwork({super.key, required this.imageurl,  this.height=180,  this.width=140});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:imageurl,
      height:height ,
      width:width ,
      fit: BoxFit.cover,
      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: imageProvider,
      //         fit: BoxFit.cover,
      //         // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
      //         ),
              
      //   ),
      // ),
      placeholder: (context, url) => Skeletonizer(child: Container(height: height,width: width,color: Colors.grey,)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class CustomNetwork extends StatelessWidget {
//   final String imageUrl;
//   final double height;
//   final double width;

//   const CustomNetwork({
//     super.key,
//     required this.imageUrl,
//     this.height = 180,
//     this.width = 140,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       height: height,
//       width: width,
//       imageBuilder: (context, imageProvider) => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           image: DecorationImage(
//             image: imageProvider,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       placeholder: (context, url) => Container(
//         height: height,
//         width: width,
//         color: Colors.grey.shade300,
//       ),
//       errorWidget: (context, url, error) => Container(
//         height: height,
//         width: width,
//         color: Colors.grey.shade300,
//         child: Icon(Icons.error, color: Colors.red, size: 30),
//       ),
//     );
//   }
// }
