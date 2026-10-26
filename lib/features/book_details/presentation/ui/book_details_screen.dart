import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookDetailsCubit, BookDetailsState>(
        builder: (context, state) {
          if (state is GetBookDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetBookDetailsSuccess) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    11.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ArrowBack(),
                        Icon(Icons.bookmark_border, size: 26.sp),
                      ],
                    ),
                    20.verticalSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            10.verticalSpace,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.network(
                                state.details?.image ?? "",
                                height: 200.h,
                                width: 130.w,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    height: 200.h,
                                    width: 130.w,
                                    child: Icon(Icons.book, size: 50.sp),
                                  );
                                },
                              ),
                            ),
                            14.verticalSpace,
                            Text(
                              state.details?.name ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              state.details?.category ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFFBFA054),
                              ),
                            ),
                            18.verticalSpace,
                            Text(
                              state.details?.description ?? "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 12.sp,
                                height: 1.7,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "£${state.details?.priceAfterDiscount ?? state.details?.price ?? ""}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2F2F2F),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 48.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2F2F2F),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
