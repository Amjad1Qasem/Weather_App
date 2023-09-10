import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/controllers/controller.dart';
import 'package:weather_app/utilities/translation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static TextEditingController searchController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? locations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 30.sp, end: 5.sp, top: 30.sp, bottom: 30.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    translation(context).my_locations,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formkey,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                onChanged: (value) {
                                  locations = value;
                                  WeatherCurrentController.getCurrentWeather(
                                    cityNmae: locations!,
                                  );
                                },
                                onSaved: (value) {
                                  locations = value;
                                  WeatherCurrentController.getCurrentWeather(
                                    cityNmae: locations!,
                                  );
                                },
                                style: Theme.of(context).textTheme.bodySmall,
                                controller: searchController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 25.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  hintText: translation(context).find_location,
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      width: 1.w,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  searchController.clear();
                                },
                                child: Text(
                                  'Cansel',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {}, child: const Text('Syrai'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
