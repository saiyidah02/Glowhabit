import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {

  bool _isPro = false;
  bool _hasUsedTrial = false;
  bool _isTrial = false;

  DateTime? _expiryDate;

  // Get membership information
  bool get isPro {
    if (!_isPro || _expiryDate == null) {
      return false;
    }

    return DateTime.now().isBefore(_expiryDate!);
  }

  bool get hasUsedTrial => _hasUsedTrial;

  bool get isTrial => isPro && _isTrial;

  DateTime? get expiryDate => _expiryDate;

  // Start 14-day free trial
  bool startFreeTrial() {

    if (_hasUsedTrial || isPro) {
      return false;
    }

    _hasUsedTrial = true;
    _isPro = true;
    _isTrial = true;

    _expiryDate = DateTime.now().add(
      const Duration(days: 14),
    );

    notifyListeners();

    return true;
  }

  // Demo subscription activation
  // Real payment integration will be added later.
  void activateDemoSubscription() {

    _isPro = true;
    _isTrial = false;

    _expiryDate = DateTime.now().add(
      const Duration(days: 30),
    );

    notifyListeners();
  }

  // Check subscription expiry
  void checkExpiry() {

    if (_expiryDate != null &&
        DateTime.now().isAfter(_expiryDate!)) {

      _isPro = false;
      _isTrial = false;

      notifyListeners();
    }
  }

}
