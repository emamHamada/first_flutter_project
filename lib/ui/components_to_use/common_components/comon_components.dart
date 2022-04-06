import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/customdrawer_controller.dart';
import '../../../cubit/cubit.dart';
import '../constants/constants.dart';

CircleAvatar buildCircleAvatar({logic, photo, radius}) {
  return CircleAvatar(
    backgroundImage: photo,
    onBackgroundImageError: (object, stack) {
      debugPrint(object.toString());
    },
    // foregroundImage: controller.forGroundImage,
    radius: radius,
    child: const Text(''),
  );
}

TextStyle style1 = GoogleFonts.abel(
  textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey.shade700,
  ),
);

Text buildText({text, style,  fontSize=16.0,color}) {
  return Text(text,
      style: GoogleFonts.syneMono(
          textStyle: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold)));
}

IconButton myIconButton({onPressed, icon,}) {
  return IconButton(onPressed: onPressed, icon: icon);
}

TextFormField myTextFormField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      enabled: true,
      //  prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blueAccent.shade700,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Colors.blueGrey),
      ),
      // focusedErrorBorder
      // :,
      // disabledBorder
      // :,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.indigoAccent,
          width: 2.0,
        ),
      ),
      label: const Text('Search'),
      //  icon: Icon(Icons.search),
    ),
    //controller: searchController,
    keyboardType: TextInputType.text,
    onChanged: (value) {
      NewsCubit.get(context).getSearches(value);
    },
  );
}

//divider
Padding buildMyDivider(CustomDrawerController logic) {
  return Padding(
    padding: const EdgeInsets.only(left: 50.0, top: 20, bottom: 10),
    child: Divider(
      height: 10,
      endIndent: 150,
      thickness: 1.5,
      color: logic.setTitleModee ? darkGreyClr : Colors.blueGrey.shade200,
    ),
  );
}

BottomNavigationBar myBottomNavigationBar(NewsCubit cubit) {
  return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      items: cubit.bottomItems,
      currentIndex: cubit.currentIndex,
      onTap: (index) async {
        cubit.changeSelectedValue(index);
      });
}

//components of profile list
ListTile buildListTile({
  required CustomDrawerController logic,
  required void Function()? onTap,
  required String title,
  required IconData? icon,
}) {
  return ListTile(
    onTap: onTap,
    title: Text(
      title,
      style: TextStyle(
        color: logic.setTitleModee ? darkGreyClr : Colors.blueGrey.shade200,
      ),
    ),
    leading: Icon(
      icon,
      size: 24,
      color: logic.setTitleModee ? darkGreyClr : Colors.blueGrey.shade200,
    ),
  );
}

Padding buildArticleId({list, ontap}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 50,
        color: Colors.white10,
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight:Radius.circular(15),bottomRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${list['urlToImage'] ?? 'https://cdn.vectorstock.com/i/1000x1000/39/98/error-404-page-not-found-vector-14463998.webp'}'),
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Text(
                      list['title'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:authButtonTextStyle ,

                    ),
                    Text(
                      list['publishedAt'],
                      style:textFieldHeading ,

                    )
                  ],
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

