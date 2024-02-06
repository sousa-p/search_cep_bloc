abstract class SearchCepState {}

class SearchCepSuccess implements SearchCepState {
  final Map data;
  const SearchCepSuccess(this.data);
}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}

class SearchCepError implements SearchCepState {
  final String message;
  const SearchCepError(this.message);
}
