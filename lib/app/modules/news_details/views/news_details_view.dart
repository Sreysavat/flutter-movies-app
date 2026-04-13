import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('news_details'.tr),
        centerTitle: true,
      ),
      body: Obx((){
        final article = controller.article.value!;
        return Column(
          children: [
            Hero(child: CachedNetworkImage(imageUrl: article.image!),
              tag: "${article.title}"),
            Column(
              children: [
                Text("${article.title}",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${article.publishedAt}"),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Text("${article.source!.name}")
                  ],
                ),
                SizedBox(height: 10,),
                Text("${article.content}",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                ),)
              ],
            )
          ],
        );
      }),
    );
  }
}
