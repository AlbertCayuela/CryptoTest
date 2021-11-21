import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/enums.dart';

class AppProvider with ChangeNotifier {
  //Application state
  AppState _appState = AppState.none;
  AppState get appState => _appState;
  set appState(AppState value) {
    _appState = value;
  }

  //total selected items
  int _selectedItems = 0;
  int get selectedItems => _selectedItems;
  set selectedItems(int value) {
    _selectedItems = value;
  }

  //bad coins selected
  int _badCoinsSelected = 0;
  //good coins selected
  int _goodCoinsSelected = 0;

  //handle selecting a new item
  void addSelectedItem(CryptoType cryptoType) {
    //add a new selected item
    _selectedItems++;

    //add selected to good or bad
    switch (cryptoType) {
      case CryptoType.good:
        _goodCoinsSelected++;
        break;
      case CryptoType.bad:
        _badCoinsSelected++;
        break;
      default:
        throw Exception('add selection crypto type unknown');
    }

    //handle appstate depending on number and types of selected items
    if (_selectedItems == 1) {
      _appState = AppState.none;
    } else if (_selectedItems == 2) {
      switch (_badCoinsSelected) {
        case 0:
          _appState = AppState.good;
          break;
        case 1:
          _appState = AppState.average;
          break;
        case 2:
          _appState = AppState.bad;
          break;
        default:
          throw Exception('bad coins selected number not correct');
      }
    }

    log('add selected item called, selected items: $_selectedItems, good items selected: $_goodCoinsSelected, bad items selected: $_badCoinsSelected');

    notifyListeners(); //notify all listeners
  }

  //substract one item from selected ones
  void substractSelectedItems(CryptoType cryptoType) {
    _selectedItems--;

    //handle the substracted type
    switch (cryptoType) {
      case CryptoType.good:
        _goodCoinsSelected--;
        break;
      case CryptoType.bad:
        _badCoinsSelected--;
        break;
      default:
        throw Exception('substract selected item crypto type wrong');
    }

    _appState = AppState.none;

    log('substract selected item called, selected items: $_selectedItems, good items selected: $_goodCoinsSelected, bad items selected: $_badCoinsSelected');

    notifyListeners(); //notify all listeners
  }
}
