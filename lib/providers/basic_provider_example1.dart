import 'package:flutter_riverpod/flutter_riverpod.dart';


class NumbersListNotifier  extends Notifier<List<int>>{
  @override
  List<int> build() {
    
   return [23,44,12,56,90,54,32,1,9,0,34,76,53];

  }




}






final numbersListProvider = NotifierProvider<NumbersListNotifier, List<int>>(() => NumbersListNotifier());



// riverpod cache this computation 

final evenNumberProvider = Provider<List<int>>((ref){

  final numbersList = ref.watch(numbersListProvider);

  return  numbersList.where((number) => number % 2 == 0 ).toList();
  

});







