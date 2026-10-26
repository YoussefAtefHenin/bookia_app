import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getBestSellerBooks() async {
    emit(GetBestSellerLoading());
    final response = await HomeRepo.getBestSellerBooks();
    if (response is BooksModel) {
      emit(GetBestSellerSuccess(response.data?.products));
    } else {
      emit(GetBestSellerError());
    }
  }

  search(String text) async {
    emit(SearchLoading());
    final data = await HomeRepo.search(text);
    if (data is List<Products>) {
      emit(SearchSuccess(data));
    } else {
      emit(SearchError());
    }
  }
}
