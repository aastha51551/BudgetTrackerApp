import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tracker/home/home.dart';
class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference budgetcollection=FirebaseFirestore.instance.collection('Category');
  Future<void> updateUserData(List<Expense> expenses) async {
    try {
      // Convert the list of expenses into a list of maps
      List<Map<String, dynamic>> expensesData = expenses
          .map((expense) => {'Category': expense.name, 'Price': expense.amount})
          .toList();

      // Get a reference to the user's document in the 'Category' collection
      final DocumentReference userDoc =
      budgetcollection.doc(uid);

      // Update the user's document with the expenses data
      await userDoc.set({'expenses': expensesData});
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

Stream<QuerySnapshot> get details{
  return budgetcollection.snapshots();
}
}