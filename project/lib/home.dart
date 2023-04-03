import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/theme.dart';
import 'code_reception.dart';
import 'group_creation.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required String title});

  get title => null;

  // TODO: Cross-Platform working QR Screen
  void showQR(context) {
    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => const CodeReception(title: "Join a Group")),
    );
  }

  // TODO: New Group Creation
  void showAdd(context) {
    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => const GroupCreation(title: "Group Creation")),
    );
  }

  // TODO: Actual New Settings
  void showSettings(context) {
    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => const Settings(title: "Round")),
    );
  }

  void selectedGroup(int group) {
    print("Tapped group $group");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight - (0.18 * screenHeight),
            child: GridView.count(
                childAspectRatio: (screenWidth / 2 - 32) / (148),
                padding: EdgeInsets.only(
                    top: 48 + MediaQuery.of(context).viewPadding.top + 8 + 8),
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => selectedGroup(index),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                  roundPurple, BlendMode.srcIn),
                              child: Image.asset("images/GroupRound.png",
                                  width: 120, height: 120, isAntiAlias: true),
                            ),
                            PlatformText("🖥️️",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: PlatformText(
                            "STEM Baddies",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                })),
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                  width: screenWidth,
                  height: MediaQuery.of(context).viewPadding.top + 8),
              Image.asset('images/WordMark-Dark.png',
                  width: screenWidth, height: 48),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            "images/BarEclipse.png",
            width: screenWidth,
            fit: BoxFit.fill,
            height: 0.20 * screenHeight,
            isAntiAlias: true,
          ),
        ),
        Positioned(
          width: screenWidth - 32,
          height: 0.20 * screenHeight - 16,
          left: 16,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    icon: Image.asset("images/RoundQR.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showQR(context),
                  )),
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    icon: Image.asset("images/RoundPlus.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showAdd(context),
                  )),
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    icon: Image.asset("images/RoundSettings.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showSettings(context),
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}
