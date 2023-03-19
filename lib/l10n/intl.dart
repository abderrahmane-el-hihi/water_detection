// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/message_lookup_by_library.dart';

// import 'messages_all.dart';

// class AppLocalizations {
//   AppLocalizations(this.localeName);

//   final String localeName;

//   static Future<AppLocalizations> load(Locale locale) {
//     final name =
//         locale.countryCode == null ? locale.languageCode : locale.toString();
//     final localeName = Intl.canonicalizedLocale(name);

//     return initializeMessages(localeName).then((_) {
//       return AppLocalizations(localeName);
//     });
//   }

//   static AppLocalizations? of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }

//   String get greeting {
//     return Intl.message(
//       'Hello!',
//       name: 'greeting',
//       desc: 'Greeting',
//     );
//   }

//   String get hello {
//     return Intl.message(
//       'Hello',
//       name: 'hello',
//       desc: 'The word "Hello"',
//     );
//   }

//   String get world {
//     return Intl.message(
//       'World',
//       name: 'world',
//       desc: 'The word "World"',
//     );
//   }
// }

// class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return ['en', 'fr', 'ar'].contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) {
//     return AppLocalizations.load(locale);
//   }

//   @override
//   bool shouldReload(AppLocalizationsDelegate old) {
//     return false;
//   }
// }

// typedef Future<dynamic> LibraryLoader();
// Map<String, LibraryLoader> _deferredLibraries = {
//   'messages': () => Future.value(null),
// };

// MessageLookupByLibrary? _findExact(String localeName) {
//   switch (localeName) {
//     case 'en':
//       return messagesEn;
//     case 'fr':
//       return messagesFr;
//     case 'ar':
//       return messagesAr;
//     default:
//       return null;
//   }
// }

// MessageLookupByLibrary? _findFallback(String localeName) {
//   switch (localeName) {
//     case 'en':
//       return messagesEn;
//     default:
//       return null;
//   }
// }

// Future<AppLocalization> initializeMessages(String localeName) async {
//   final preferExact = true;
//   final lookup = (preferExact ? _findExact : _findFallback)(localeName);

//   final load =
//       _deferredLibraries[lookup?.locale ?? ''] ?? _deferredLibraries[''];
//   await load?.call?.call();

//   if (lookup != null) {
//     final messages = lookup.messages;
//     final formatter = lookup.formatter;

//     return AppLocalization(
//       messages,
//       formatter: formatter,
//     );
//   }

//   throw 'Locale $localeName not found';
// }
