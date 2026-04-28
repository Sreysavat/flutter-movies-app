import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbay_news_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('news'.tr),
        centerTitle: true,
        leading: TextButton(onPressed: (){
          Get.toNamed(Routes.LOGIN);
        }, child: Icon(Icons.logout,size: 22,)),
        actions: [
          TextButton(onPressed: controller.chooseYourLang, child: Icon(Icons.language,size: 22,)),
          TextButton(onPressed: controller.changeTheme, child: Icon(Icons.dark_mode,size: 22,))
        ],
      ),
      body: Obx((){
        if(!controller.hasConnection.value){
            return Center(child: Text("Check your internet"),);
        }
        if(controller.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }
        return RefreshIndicator(
          onRefresh: () async{
            controller.getNews();
          },
          child: ListView.builder(
              itemCount: controller.news.value.articles!.length,
              itemBuilder: (context,index){
                final article = controller.news.value.articles![index];

                return GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.NEWS_DETAILS,arguments: article);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Hero(
                                tag: "${article.title}",
                                child: CachedNetworkImage(imageUrl: article.image!,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                                ),
                              ),),
                          SizedBox(height: 10,),
                          Text("${article.title}",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 18
                          ),),
                          Text("${article.description}",
                            style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),
                          maxLines: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }

          ),
        );
      })
    );
  }
}
