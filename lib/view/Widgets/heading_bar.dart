import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';

class HeadinBar extends StatelessWidget {
  const HeadinBar({
    Key key,
    @required this.label,
    @required this.count,
    @required this.onTap,
  }) : super(key: key);

  final String label, count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: kPadding / 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kTextColor),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text('See all ($count)',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: kSecondaryTextColor,
                      )),
            )
          ],
        ));
  }
}