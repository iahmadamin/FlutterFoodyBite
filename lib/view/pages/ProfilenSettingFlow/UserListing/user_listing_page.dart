import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/user_model.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:get/get.dart';

class UserListingPage extends StatelessWidget {
  const UserListingPage(
      {this.findNewFriends = false,
      @required this.appBarTitle,
      this.isFollowing = false,
      @required this.userList});
  final List<UserModel> userList;
  final String appBarTitle;
  final bool findNewFriends, isFollowing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          title: appBarTitle,
          appBar: AppBar(),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              if (findNewFriends)
                Padding(
                  padding: const EdgeInsets.only(
                    left: kPadding,
                    bottom: kPadding * 1.5,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Suggestions',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: kSecondaryTextColor,
                          ),
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) =>
                      UserTile(isFollowing: isFollowing, user: userList[index]),
                ),
              ),
            ],
          ),
        ));
  }
}

class UserTile extends StatelessWidget {
  const UserTile({@required this.isFollowing, @required this.user});
  final UserModel user;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      padding: const EdgeInsets.only(bottom: kPadding * 1.2),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              user.imgPath,
            ),
          ),
          const SizedBox(
            width: kPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: kPadding / 2),
              Text(
                user.reviews.length.toString() + ' Reviews',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const Spacer(),
          MButton(
            isFilled: !isFollowing,
            txtSize: 12,
            label: isFollowing ? 'Unfollow' : 'Follow',
            onTap: () {},
            height: 26,
            width: 70,
          ),
        ],
      ),
    );
  }
}