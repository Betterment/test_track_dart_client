import 'package:test_track/src/models/split_registry.dart';
import 'package:test_track/src/models/visitor.dart';

/// Interface for defining how to persist and retrieve local TestTrack state, e.g. to/from disk
abstract class DataStorageProvider {
  /// Handles any initialization required
  Future<void> initialize();

  /// Fetch the visitor from storage and return it
  ///
  /// Returns null if no visitor found in storage
  Future<Visitor?> fetchVisitor();

  /// Stores the visitor in storage system
  Future<void> storeVisitor(Visitor visitor);

  /// Fetch the split registry from storage and return it
  ///
  /// Returns null if no split registry found in storage
  Future<SplitRegistry?> fetchSplitRegistry();

  /// Stores the split registry in storage system
  Future<void> storeSplitRegistry(SplitRegistry splitRegistry);

  /// Store the user's login state. [isLoggedIn] will be true
  /// when the user has successfully been logged in to the TT
  /// server remotely.
  Future<void> storeLoginState(bool isLoggedIn);

  /// Fetch the current user's login state. Returns [true] if the
  /// user is correctly logged in.
  Future<bool> fetchLoginState();
}
