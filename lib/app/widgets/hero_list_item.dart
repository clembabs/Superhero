import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroListItem extends StatelessWidget {
  final Function()? onTap;
  final String coverPhotoUrl;
  final String name;
  final String fullName;
  final List<String>? aliases;
  const HeroListItem(
      {Key? key,
      this.onTap,
      required this.coverPhotoUrl,
      required this.name,
      required this.fullName,
      this.aliases})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 114,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 102,
                  width: 140,
                  color: Colors.white,
                  child: GetUtils.isNull(
                    coverPhotoUrl,
                  )
                      ? Container(
                          color: Colors.white,
                          height: 102,
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
                    ).paddingOnly(bottom: 8),
                    Text(
                      fullName,
                    ).paddingOnly(bottom: 8),
                    if (aliases == null)
                      Text(
                        aliases!.join(', '),
                      ).paddingOnly(bottom: 8),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'More Info',
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
      );
}
