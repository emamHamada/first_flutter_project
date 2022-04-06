import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:get/get.dart';
import '../../cubit/cubit.dart';

import '../../cubit/states.dart';
import '../../ui/components_to_use/common_components/comon_components.dart';
import '../wepview/wepview.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return ConditionalBuilder(
            builder: (context) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder:  (context, index) => buildArticleId(list:list[index],ontap:() async {
                  Get.to(() => WebViewScreen(
                    url: list[index]['url'],val: 'Science',
                  ),);
                },),
                itemCount: list.length),
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                  color: Colors.blueGrey.shade500,
                  strokeWidth: 6,
                  backgroundColor: Colors.blueGrey),
            ),
            condition: list.isNotEmpty,
          );
        });
  }

}
