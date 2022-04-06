import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import '../../components_to_use/common_components/comon_components.dart';
import '../drawer/drawer.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsCubit()
          ..getBusiness()
          ..getScience()
          ..getSports();
      },
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                myIconButton(
                    onPressed: () {
                      cubit.changeSelectedValue(3);
                    },
                    icon: const Icon(Icons.search)),
                const SizedBox(
                  width: 20,
                ),
              ],
              elevation: 50,
              centerTitle: true,
              leading: myIconButton(
                icon: const Icon(
                  Icons.person_pin_outlined,
                  size: 20,
                ),
                onPressed: () async {
                  NavigationDrawer.of(context)?.toggle();
                },
              ),
              title: cubit.currentIndex == 3
                  ? SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: myTextFormField(context),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        title: buildText(
                          text: 'News ToDay',
                          fontSize: 25.0,
                          color: Colors.blueGrey
                        ),
                        subtitle: buildText(
                          text: '${DateFormat.yMMMd().format(DateTime.now())} ',
                          fontSize: 16.0,
                          color: Colors.blueGrey
                        ),
                      ),
                    ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: myBottomNavigationBar(cubit),
          );
        },
      ),
    );
  }
}
