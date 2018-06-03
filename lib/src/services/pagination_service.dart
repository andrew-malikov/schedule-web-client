import 'package:angular/di.dart';

class PaginationData {
  dynamic data;
  int index;

  PaginationData(this.data, this.index);

  static List<PaginationData> getData(List<dynamic> inputData) {
    List<PaginationData> outputData = new List<PaginationData>();
    if (inputData != null)
      for (var i = 0; i < inputData.length; i++)
        outputData.add(new PaginationData(inputData[i], i + 1));
    return outputData;
  }
}

@Injectable()
class PaginationService {
  List<PaginationData> _data;

  set _setData(List<dynamic> data) => _data = PaginationData.getData(data);

  List<PaginationData> selectedData;

  List<int> numerator;

  int _maxStack;
  int _maxNumeratorControl;

  int selectedPage;

  PaginationService(List<dynamic> data, int maxStack, int maxNumeratorControl) {
    _setData = data;
    _maxStack = maxStack;
    _maxNumeratorControl = maxNumeratorControl;
    selectedData = new List<PaginationData>();
    numerator = new List<int>();
    selectedPage = 1;
  }

  void selectFirstPage() {
    if (_data.length > 0) updateSelectedPage(1);
  }

  void selectPreviousPage() {
    if (selectedPage - 1 > 0) updateSelectedPage(selectedPage - 1);
  }

  void selectLastPage() {
    if (_data.length > 0) updateSelectedPage(getPartCount());
  }

  void selectNextPage() {
    if (selectedPage + 1 <= getPartCount())
      updateSelectedPage(selectedPage + 1);
  }

  void updateSelectedPage([int page = 0]) {
    if (page != 0) {
      _setSelectedData(page);
      _setNumerator();
    }
  }

  void updateData(List<dynamic> data) {
    _setData = data;
    _data.length > 0 ? updateSelectedPage(1) : updateSelectedPage(1);
  }

  int getPartCount() {
    return (_data.length / _maxStack).ceil();
  }

  void _setSelectedData(int number) {
    selectedData.clear();
    for (var i = (number - 1) * _maxStack;
        i < number * _maxStack && i < _data.length;
        i++) selectedData.add(_data[i]);
    selectedPage = number;
  }

  void _setNumerator() {
    numerator = new List<int>();
    _setLeftNumeratorPart(getOptimizedLeftPart());
    numerator.add(selectedPage);
    _setRightNumeratorPart(getOptimizedRightPart());
  }

  int getLeftPart() {
    return selectedPage > (_maxNumeratorControl / 2).floor()
        ? (_maxNumeratorControl / 2).floor()
        : selectedPage - 1;
  }

  int getRightPart() {
    return selectedPage + (_maxNumeratorControl / 2).floor() < getPartCount()
        ? (_maxNumeratorControl / 2).floor()
        : getPartCount() - selectedPage;
  }

  int getOptimizedLeftPart() {
    return getRightPart() < (_maxNumeratorControl / 2).floor() &&
            getLeftPart() + _maxNumeratorControl - getRightPart() <=
                getPartCount()
        ? getLeftPart() + _maxNumeratorControl - getRightPart()
        : getLeftPart();
  }

  int getOptimizedRightPart() {
    return getLeftPart() < (_maxNumeratorControl / 2).floor() &&
            getRightPart() + _maxNumeratorControl - getLeftPart() <=
                getPartCount()
        ? getRightPart() + _maxNumeratorControl - getLeftPart()
        : getRightPart();
  }

  void _setLeftNumeratorPart(int count) {
    for (var i = count; i > 0; i--) {
      numerator.add(selectedPage - i);
    }
  }

  void _setRightNumeratorPart(int count) {
    for (var i = 1; i <= count; i++) {
      numerator.add(selectedPage + i);
    }
  }
}
