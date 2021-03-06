import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:get/get.dart';

class MDialogs {
  static Future<void> confirmationDialog({
    @required String title,
    @required VoidCallback onYesTap,
    @required VoidCallback onNoTap,
  }) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        titleStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        titlePadding: const EdgeInsets.fromLTRB(
          defaultPadding * 1.5,
          defaultPadding * 2,
          defaultPadding * 1.5,
          defaultPadding * 2,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onNoTap,
              child: Text(
                Values.no.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: onYesTap,
              child: Text(
                Values.yes.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }

  static Future<void> menuDialog({
    @required VoidCallback onEditTap,
    @required VoidCallback onDeleteTap,
  }) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: '',
        titlePadding: const EdgeInsets.all(0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onEditTap,
              child: Text(
                Values.edit.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            GestureDetector(
              onTap: onDeleteTap,
              child: Text(
                Values.delete.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                Values.cancel.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }

  static Future<void> imagePickerDialog({
    @required VoidCallback onCameraTap,
    @required VoidCallback onGalleryTap,
  }) {
    return Get.defaultDialog(
      title: Values.chose_or_take_picture.tr,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      titlePadding: const EdgeInsets.fromLTRB(
        defaultPadding * 1.5,
        defaultPadding * 2,
        defaultPadding * 1.5,
        defaultPadding,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onCameraTap,
            child: Column(
              children: [
                const Icon(
                  Icons.photo_camera_outlined,
                  size: 36,
                  color: primaryColor,
                ),
                Text(
                  Values.camera.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onGalleryTap,
            child: Column(
              children: [
                const Icon(
                  Icons.image,
                  size: 36,
                  color: primaryColor,
                ),
                Text(
                  Values.gallery.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
