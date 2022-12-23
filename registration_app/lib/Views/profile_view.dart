import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registration_app/Profile/profile.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Services/auth_service.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isTextFieldShowed = false;
  late final TextEditingController _nameController;

  String? imagePath;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Tap back button again to close app",
            style: AppTheme.whiteText.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100 * Responsive().widthConfig,
                height: 40 * Responsive().heightConfig,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      10 * Responsive().imageConfig,
                    ),
                    bottomRight: Radius.circular(
                      10 * Responsive().imageConfig,
                    ),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickMedia();
                        },
                        child: Profile().imageUrl != null
                            ? Container(
                                width: 32 * Responsive().widthConfig,
                                height: 15 * Responsive().heightConfig,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.4 * Responsive().imageConfig,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    100 * Responsive().imageConfig,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(Profile().imageUrl!),
                                  ),
                                ),
                              )
                            : Container(
                                width: 32 * Responsive().widthConfig,
                                height: 15 * Responsive().heightConfig,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.4 * Responsive().imageConfig,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    100 * Responsive().imageConfig,
                                  ),
                                ),
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 20 * Responsive().imageConfig,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      heightSpace(2),
                      isTextFieldShowed
                          ? Container(
                              width: 50 * Responsive().widthConfig,
                              height: 3 * Responsive().heightConfig,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  2 * Responsive().imageConfig,
                                ),
                              ),
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: GestureDetector(
                                    onTap: () async {
                                      if (_nameController.text.isNotEmpty) {
                                        await AuthService.addName(
                                          email: Profile().email,
                                          name: _nameController.text,
                                        );
                                        Profile().name = _nameController.text;
                                        setState(() {
                                          isTextFieldShowed = false;
                                        });
                                      }
                                    },
                                    child: const Icon(
                                      Icons.check,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Profile().name != null
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isTextFieldShowed = true;
                                    });
                                  },
                                  child: Text(
                                    Profile().name!,
                                    style: AppTheme.whiteText.button,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isTextFieldShowed = true;
                                    });
                                  },
                                  child: Text(
                                    "+ add name",
                                    style: AppTheme.whiteText.subtitle1,
                                  ),
                                ),
                      heightSpace(1),
                      Text(
                        Profile().email,
                        style: AppTheme.whiteText.button,
                      )
                    ],
                  ),
                ),
              ),
              heightSpace(10),
              Container(
                width: 80 * Responsive().widthConfig,
                height: 8 * Responsive().heightConfig,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLightColor,
                  borderRadius: BorderRadius.circular(
                    5 * Responsive().imageConfig,
                  ),
                ),
                child: Center(
                  child: Text(
                    Profile().username,
                    style: AppTheme.whiteText.button,
                  ),
                ),
              ),
              heightSpace(25),
              GestureDetector(
                onTap: () {
                  Profile().name = null;
                  Profile().username = "";
                  Profile().email = "";
                  Profile().imageUrl = null;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginViewRoute,
                    (route) => false,
                  );
                },
                child: Icon(
                  Icons.logout,
                  size: 20 * Responsive().imageConfig,
                  color: AppTheme.primaryDarkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pickMedia() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      imagePath = file.path;
      await AuthService.uploadProfileImage(
        filePath: imagePath!,
      );
      setState(() {});
    }
  }
}
