import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';

class RollerPrizeDialog extends StatelessWidget {
  final Size rawImgSize = Size(394, 401);
  final double dialogWidth =
      (Global.device.width >= 320) ? 228 : Global.device.width - 92;

  final String imgUrl;

  RollerPrizeDialog(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    Size imageSize = rawImgSize * (dialogWidth / 394);
    return DialogWidget(
      noBackground: true,
      canClose: false,
      constraints: BoxConstraints(
        maxHeight: imageSize.height + 50 + 36,
        maxWidth: dialogWidth,
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(imageSize),
              child: networkImageBuilder(imgUrl),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints.tight(Size(50.0, 50.0)),
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 46.0,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
