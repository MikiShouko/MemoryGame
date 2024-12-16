import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateGameData(String userId, Map<String, dynamic> gameData, {bool isQuitting = false}) async {
    try {
      final docRef = _firestore.collection('users').doc(userId);

      // First get the current document data
      DocumentSnapshot snapshot = await docRef.get();
      if (!snapshot.exists) {
        throw Exception('User document not found');
      }

      Map<String, dynamic> currentData = snapshot.data() as Map<String, dynamic>;

      // Get the current quit count
      int currentQuitCount = currentData['gameData']?['quitCount'] ?? 0;

      // Prepare the new game data
      Map<String, dynamic> newGameData = {
        ...currentData['gameData'] ?? {},  // Preserve existing game data
        ...gameData['gameData'] as Map<String, dynamic>,  // Add new game data
      };

      // Update quit count only if quitting
      if (isQuitting) {
        newGameData['quitCount'] = currentQuitCount + 1;
      } else {
        newGameData['quitCount'] = currentQuitCount;  // Preserve current quit count
      }

      // Update the document
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