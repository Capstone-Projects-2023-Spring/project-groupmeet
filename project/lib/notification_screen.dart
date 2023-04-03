import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/social_media_sign_up_onboarding.dart';
import 'package:groupmeet/theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  void buttonPress(BuildContext context) {
    Navigator.of(context).push(platformPageRoute(
        context: context, builder: (context) => const SocialMediaOnboarding()));
  }
  void popupNotification(BuildContext context) {
    // Actual screen that toggles notifications
    PlatformAlertDialog error = PlatformAlertDialog(
      content: PlatformText("Allow notifications?"),
      actions: [
        PlatformTextButton(
          child: PlatformText("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) {
        return error;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("Toggle Notifications"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlatformText("Allow the app to send you notifications"),
          const SizedBox(height: 20),
          PlatformElevatedButton(
            color: roundPurple,
            onPressed: () => popupNotification(context),
            child: PlatformText("Allow"),
          ),
          PlatformElevatedButton(
            color: roundPurple,
            onPressed: () => buttonPress(context),
            child: PlatformText("Continue without notifications"),
          ),
        ],
      ),
    );
  }
}


