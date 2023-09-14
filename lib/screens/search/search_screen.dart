import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/search/search_cubit.dart';
import 'package:weather_app/controllers/controller.dart';
import 'package:weather_app/layout/home_layout.dart';
import 'package:weather_app/models/class.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/utilities/translation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static TextEditingController searchController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? location;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
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
                                child: Builder(builder: (context) {
                                  return TextFormField(
                                    onChanged: (value) {
                                      location = value;
                                    },
                                    onEditingComplete: () {
                                      final searchCubit =
                                          context.read<SearchCubit>();
                                      if (location != null) {
                                        searchCubit.search(location!);
                                        FocusScope.of(context).unfocus();
                                      }
                                    },
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      hintText:
                                          translation(context).find_location,
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
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    searchController.clear();
                                  },
                                  child: Text(
                                    translation(context).cancel,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ))
                            ],
                          ),
                        ),
                        Builder(builder: (context) {
                          final state = context.watch<SearchCubit>().state;
                          if (state is SearchLoading) {
                            return SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                                child: const Center(
                                    child: CircularProgressIndicator()));
                          } else if (state is SearchError) {
                            return Padding(
                              padding: EdgeInsets.all(10.0.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.message,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Colors.red,
                                        ),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is! SearchFetched) {
                            return const SizedBox();
                          }

                          return Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  child: Text(
                                    '${state.currentModel.location.country} ,${state.currentModel.location.name} .',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        // FutureBuilder<WeatherCurrentModel>(
                        //     future: WeatherCurrentController.getCurrentWeather(
                        //         cityNmae: locations!),
                        //     builder: (context, snapshot) {
                        //       if (!snapshot.hasData) {
                        //         return const Center(
                        //             child: CircularProgressIndicator());
                        //       }
                        //       final weather = snapshot.data!;
                        //       return Row(
                        //         children: [
                        //           TextButton(
                        //               onPressed: () {}, child:  Text('${weather.location!.name},${weather.location!.country}'))
                        //         ],
                        //       );
                        //     })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
