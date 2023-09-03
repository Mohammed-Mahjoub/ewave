import 'package:ewave/screens/bn_screens/recommendation/recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/categories_controller.dart';

class MarketsScreen extends StatefulWidget {
  const MarketsScreen({Key? key}) : super(key: key);

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoriesController().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return  RecommendationScreen(snapshot.data![index].sId!,snapshot.data![index].name!);
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data![index].image!,
                        height: 100.h,
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        snapshot.data![index].name!,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}