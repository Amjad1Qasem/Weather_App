import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/themes/app_colors.dart';

abstract class AppTheme{
  static ThemeData get light =>ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      onPrimary: AppColors.blue ,
      ),
      scaffoldBackgroundColor: AppColors.pastelGray,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(
        textStyle:  TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.darkBlue
          ),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlue
          )
        ),
        titleMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 28.sp,
            color: AppColors.goldenrod
          )
        ),
        titleSmall: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color:AppColors.darkBlue,
          )
        ),
        labelSmall: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.gray
          )
        ),
        labelMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.darkBlue,
          )
        ),
         labelLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 64.sp,
            fontWeight: FontWeight.bold ,
            color: AppColors.darkBlue,
          )
        ),
         displaySmall: GoogleFonts.poppins(
         textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white
          ),
        ),
      )
      );

      
   static ThemeData get dark =>ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.navy,
      onPrimary: AppColors.goldenrod,
      ), 
      scaffoldBackgroundColor: AppColors.darkBlue, 
      textTheme: TextTheme( 
        bodySmall: GoogleFonts.poppins(
         textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.white
          ),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white
          )
        ),
        titleMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 28.sp,
            color: AppColors.white
          )
        ),
        titleSmall: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color:AppColors.white,
          )
        ),
         labelSmall: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.gray
          )
        ),
        labelMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.white,
          )
        ),
         labelLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 64.sp,
            fontWeight: FontWeight.bold ,
            color: AppColors.white,
          )
        ),
        displaySmall: GoogleFonts.poppins(
         textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white
          ),
        ),
      )  
      
  );
}