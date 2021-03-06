import 'package:flutter/material.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:get/get.dart';

class FavouriteRestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          title: Values.my_favourite.tr,
          appBar: AppBar(),
        ),
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: restaurantList.length + 1,
            itemBuilder: (_, index) => index < restaurantList.length
                ? RestaurantTile(
                    restaurant: restaurantList[index],
                    forFavourite: true,
                  )
                : SizedBox(
                    height: getRelativeHeight(0.12),
                  ),
          ),
        ));
  }
}
