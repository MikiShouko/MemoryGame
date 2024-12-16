import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateGameData(String userId, Map<String, dynamic> gameData, {bool isQuitting = false}) async {
    try {
      final docRef = _firestore.collection('users').doc(userId);

      DocumentSnapshot snapshot = await docRef.get();
      if (!snapshot.exists) {
        throw Exception('User document not found');
      }

      Map<String, dynamic> currentData = snapshot.data() as Map<String, dynamic>;

      int currentQuitCount = currentData['gameData']?['quitCount'] ?? 0;

      Map<String, dynamic> newGameData = {
        ...currentData['gameData'] ?? {},
        ...gameData['gameData'] as Map<String, dynamic>, 
      };

      if (isQuitting) {
        newGameData['quitCount'] = currentQuitCount + 1;
      } else {
        newGameData['quitCount'] = currentQuitCount;
      }

      await docRef.update({
        'gameData': newGameData,
      });

      print('Game data updated successfully for user: $userId');
      print('Current quit count: ${newGameData['quitCount']}');

    } catch (e) {
      print('Error updating game data: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      print('Fetching data for user: $userId');
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(userId).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        print('Successfully fetched user data: $data');
        return data;
      }
      return null;
    } catch (e) {
      print('Error fetching user data: $e');
      rethrow;
    }
  }
}
