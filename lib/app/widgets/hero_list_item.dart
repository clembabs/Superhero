import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroListItem extends StatelessWidget {
  final Function()? onTap;
  final String coverPhotoUrl;
  final String name;
  final String fullName;
  final String? gender;
  const HeroListItem(
      {Key? key,
      this.onTap,
      required this.coverPhotoUrl,
      required this.name,
      required this.fullName,
      this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 114,
        child: GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(.4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 114,
                      width: 140,
                      color: Colors.white,
                      child: GetUtils.isNull(
                        coverPhotoUrl,
                      )
                          ? Container(
                              color: Colors.white,
                              height: 1114,
                            )
                          : Image.network(
                              coverPhotoUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20.0),
                        ).paddingOnly(bottom: 8),
                        Text(
                          fullName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16.0),
                        ).paddingOnly(bottom: 8),
                        if (gender == null)
                          Text(
                            gender!,
                            overflow: TextOverflow.ellipsis,
                          ).paddingOnly(bottom: 8),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'More Info',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
