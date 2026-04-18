import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_robo/core/utils/app_colors.dart';
import 'package:mini_robo/features/camera_screens/logic/cubit/camera_cubit.dart';
import 'package:mini_robo/features/camera_screens/logic/cubit/camera_states.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_textfield.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class FaceIDScreen extends StatefulWidget {
  const FaceIDScreen({super.key});

  @override
  State<FaceIDScreen> createState() => _FaceIDScreenState();
}

class _FaceIDScreenState extends State<FaceIDScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //Image File
  File? image;

  //Image Picker
  final picker = ImagePicker();

  //pick Image method
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) {
        if (state is CameraSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.msg)));
          Navigator.pop(context);
        } else if (state is CameraErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 40,
                              color: AppColors.icons,
                            ),
                          ),
                        ),

                        SizedBox(width: 10),
                        Expanded(flex: 5, child: CustomTitle()),
                      ],
                    ),

                    SizedBox(height: 50.0),

                    //image display
                    Container(
                      height: 320,
                      width: 365,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        child: image != null
                            ?
                              //image selected
                              Image.file(image!, fit: BoxFit.cover)
                            //no image selected
                            : Center(
                                child: CustomText(
                                  text: "No image selected",
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    //buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //camera button
                        CustomButton(
                          text: "Camera",
                          fontSize: 24,
                          width: 160,
                          height: 75,
                          onTap: () => pickImage(ImageSource.camera),
                        ),

                        SizedBox(width: 2.0),
                        //gallery button
                        CustomButton(
                          text: "Gallery",
                          fontSize: 24,
                          width: 170,
                          height: 75,
                          onTap: () => pickImage(ImageSource.gallery),
                        ),
                      ],
                    ),

                    SizedBox(height: 40.0),

                    //name input
                    CustomButton(
                      text: "Please Enter Your First Name",
                      fontSize: 22.0,
                      width: 370,
                      height: 90.0,
                      fontColor: Color(0xffEBEBEB),
                      onTap: () {},
                    ),

                    const SizedBox(height: 15.0),

                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomTextField(
                            hintText: 'First Name',
                            controller: _userNameController,
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            fontSize: 22.0,
                            width: 40,
                            height: 68.0,
                            fontColor: AppColors.textColor2,
                            text: state is CameraLoadingState ? "..." : "Done",
                            onTap: state is CameraLoadingState
                                ? () {}
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      if (image == null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Please select image first",
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      context.read<CameraCubit>().registerUser(
                                        _userNameController.text,
                                        image!,
                                      );
                                    }
                                  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
