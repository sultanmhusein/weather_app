import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/constants/local_constants.dart';
import 'package:weather_app/presentations/cubit/weather_cubit.dart';
import 'package:weather_app/presentations/widgets/background/background_sky.dart';
import 'package:weather_app/presentations/widgets/button/primary_button.dart';
import 'package:weather_app/presentations/widgets/dialog/custom_dialog.dart';
import 'package:weather_app/presentations/widgets/searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:weather_app/presentations/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/shared/routers.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(text: "");
  String? selectedProvince = "Aceh";
  String? selectedCity;
  List<String>? listProvince = [];
  List<String>? listCity = [];
  String? cityKeyword;
  late WeatherCubit _weatherCubit;

  void initState() {
    super.initState();
    fetchProvince();
    _weatherCubit = context.read<WeatherCubit>();
  }

  fetchProvince() {
    provinceMap.forEach((key, value) {
      setState(() {
        listProvince?.add(key);
      });
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackgroundSky(),
      SafeArea(
          child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherFailed) {
            CustomDialog.showErrorDialog(
                header: "Not Found",
                message: state.message,
                onPressed: () {
                  Get.back();
                });
          }
          if (state is WeatherLoaded) {
            Get.toNamed(Routers.home, arguments: [
              _nameController.text.toString(),
              selectedCity,
              state.currentWeather
            ]);
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: CustomTextField(
                              label: "Name",
                              controller: _nameController,
                              maxLength: 32,
                              validator: (value) => (value!.isEmpty)
                                  ? "Please enter your name"
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomSearchableDropdown(
                        label: "Province",
                        list: listProvince,
                        selectedItem: selectedProvince,
                        onChanged: (value) {
                          setState(() {
                            selectedCity = null;
                            selectedProvince = value!;
                            listCity = provinceMap[selectedProvince];
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Visibility(
                        visible: listCity != null && listCity!.isNotEmpty,
                        child: CustomSearchableDropdown(
                          label: "City",
                          list: listCity,
                          selectedItem: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              if (value.contains('Kabupaten')) {
                                cityKeyword =
                                    value.replaceAll('Kabupaten ', '');
                              } else if (value.contains('Kota')) {
                                cityKeyword = value.replaceAll('Kota ', '');
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: selectedCity != null && selectedCity!.isNotEmpty,
                    child: PrimaryButton(
                      isLoading: state is WeatherLoading,
                      label: "Check Weather",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _weatherCubit.getCurrentWeather(cityKeyword!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    ]));
  }
}
