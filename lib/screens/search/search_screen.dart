import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utilities/translation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
                        child: TextFormField(
                          controller: searchController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 25.sp,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.onSecondary,
                            hintText: translation(context).find_location,
                            hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ),
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
