// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Meditation`
  String get meditation {
    return Intl.message(
      'Meditation',
      name: 'meditation',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get home_GM {
    return Intl.message(
      'Good Morning',
      name: 'home_GM',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profile_Language {
    return Intl.message(
      'Language',
      name: 'profile_Language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `LOGO`
  String get logo {
    return Intl.message(
      'LOGO',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `Take a deep Breath`
  String get takeBreath {
    return Intl.message(
      'Take a deep Breath',
      name: 'takeBreath',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Breath Your negativity to calm your mind.`
  String get breathYourNegativity {
    return Intl.message(
      'Breath Your negativity to calm your mind.',
      name: 'breathYourNegativity',
      desc: '',
      args: [],
    );
  }

  /// `Balance Your body and your spirit.`
  String get balanceYourBody {
    return Intl.message(
      'Balance Your body and your spirit.',
      name: 'balanceYourBody',
      desc: '',
      args: [],
    );
  }

  /// `Yoga keeps you mentally and physically fit.`
  String get yogaKeepsYou {
    return Intl.message(
      'Yoga keeps you mentally and physically fit.',
      name: 'yogaKeepsYou',
      desc: '',
      args: [],
    );
  }

  /// `What brings you to Meditation?`
  String get whatBrings {
    return Intl.message(
      'What brings you to Meditation?',
      name: 'whatBrings',
      desc: '',
      args: [],
    );
  }

  /// `We’ll Personalize recommendations based on your goals.`
  String get wellPersonalize {
    return Intl.message(
      'We’ll Personalize recommendations based on your goals.',
      name: 'wellPersonalize',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Are you interested in content for kids?`
  String get areYouInterested {
    return Intl.message(
      'Are you interested in content for kids?',
      name: 'areYouInterested',
      desc: '',
      args: [],
    );
  }

  /// `Select all that apply.`
  String get selectAll {
    return Intl.message(
      'Select all that apply.',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get skipForNow {
    return Intl.message(
      'Skip for now',
      name: 'skipForNow',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get yourAccount {
    return Intl.message(
      'Create your account',
      name: 'yourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Email`
  String get signUpWithEmail {
    return Intl.message(
      'Sign up with Email',
      name: 'signUpWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Have an account ?`
  String get haveAnAccount {
    return Intl.message(
      'Have an account ?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign in`
  String get signInText {
    return Intl.message(
      ' Sign in',
      name: 'signInText',
      desc: '',
      args: [],
    );
  }

  /// `By using meditation you agree to our Terms`
  String get byUsingMeditation {
    return Intl.message(
      'By using meditation you agree to our Terms',
      name: 'byUsingMeditation',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to save Your Progress`
  String get createAnAccount {
    return Intl.message(
      'Create an account to save Your Progress',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enterName {
    return Intl.message(
      'Enter name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message(
      'Enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButton {
    return Intl.message(
      'Sign up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue with facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue with facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signInAccount {
    return Intl.message(
      'Sign in to your account',
      name: 'signInAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get logIn {
    return Intl.message(
      'Login',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Need an account?`
  String get needAnAccount {
    return Intl.message(
      'Need an account?',
      name: 'needAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpText {
    return Intl.message(
      'Sign up',
      name: 'signUpText',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `My Status`
  String get myStatus {
    return Intl.message(
      'My Status',
      name: 'myStatus',
      desc: '',
      args: [],
    );
  }

  /// `Total sessions`
  String get totalSessions {
    return Intl.message(
      'Total sessions',
      name: 'totalSessions',
      desc: '',
      args: [],
    );
  }

  /// `Mindful minutes`
  String get mindfulMinutes {
    return Intl.message(
      'Mindful minutes',
      name: 'mindfulMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Longest streak`
  String get longestStreak {
    return Intl.message(
      'Longest streak',
      name: 'longestStreak',
      desc: '',
      args: [],
    );
  }

  /// `Join Premium`
  String get joinPremium {
    return Intl.message(
      'Join Premium',
      name: 'joinPremium',
      desc: '',
      args: [],
    );
  }

  /// `Badges`
  String get badges {
    return Intl.message(
      'Badges',
      name: 'badges',
      desc: '',
      args: [],
    );
  }

  /// `My Favourite`
  String get myFavourite {
    return Intl.message(
      'My Favourite',
      name: 'myFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Meditation Reminder`
  String get meditationReminder {
    return Intl.message(
      'Meditation Reminder',
      name: 'meditationReminder',
      desc: '',
      args: [],
    );
  }

  /// `Sleep Reminder`
  String get sleepReminder {
    return Intl.message(
      'Sleep Reminder',
      name: 'sleepReminder',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Edit Your Profile`
  String get editYourProfile {
    return Intl.message(
      'Edit Your Profile',
      name: 'editYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get changeYourPassword {
    return Intl.message(
      'Change your password',
      name: 'changeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get updateButton {
    return Intl.message(
      'UPDATE',
      name: 'updateButton',
      desc: '',
      args: [],
    );
  }

  /// `Breath`
  String get breath {
    return Intl.message(
      'Breath',
      name: 'breath',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finishButton {
    return Intl.message(
      'Finish',
      name: 'finishButton',
      desc: '',
      args: [],
    );
  }

  /// `SLEEP`
  String get sleepText {
    return Intl.message(
      'SLEEP',
      name: 'sleepText',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Exit?`
  String get areYouSureYouWantToExit {
    return Intl.message(
      'Are You Sure You Want To Exit?',
      name: 'areYouSureYouWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `Relaxing Sound`
  String get relaxingSound {
    return Intl.message(
      'Relaxing Sound',
      name: 'relaxingSound',
      desc: '',
      args: [],
    );
  }

  /// `Start your experience`
  String get startYourExperience {
    return Intl.message(
      'Start your experience',
      name: 'startYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to focus on?`
  String get whatWouldYouLikeToFocusOn {
    return Intl.message(
      'What would you like to focus on?',
      name: 'whatWouldYouLikeToFocusOn',
      desc: '',
      args: [],
    );
  }

  /// `Relax`
  String get relax {
    return Intl.message(
      'Relax',
      name: 'relax',
      desc: '',
      args: [],
    );
  }

  /// `Focus`
  String get focus {
    return Intl.message(
      'Focus',
      name: 'focus',
      desc: '',
      args: [],
    );
  }

  /// `Unwind`
  String get unwind {
    return Intl.message(
      'Unwind',
      name: 'unwind',
      desc: '',
      args: [],
    );
  }

  /// `Energize`
  String get energize {
    return Intl.message(
      'Energize',
      name: 'energize',
      desc: '',
      args: [],
    );
  }

  /// `Breathing`
  String get breathing {
    return Intl.message(
      'Breathing',
      name: 'breathing',
      desc: '',
      args: [],
    );
  }

  /// `CalmCalm your mind and body with longer exhalations.`
  String get calmCalmYourMindAndBodyWithLongerExhalations {
    return Intl.message(
      'CalmCalm your mind and body with longer exhalations.',
      name: 'calmCalmYourMindAndBodyWithLongerExhalations',
      desc: '',
      args: [],
    );
  }

  /// `Inhale`
  String get inhale {
    return Intl.message(
      'Inhale',
      name: 'inhale',
      desc: '',
      args: [],
    );
  }

  /// `Exhale`
  String get exhale {
    return Intl.message(
      'Exhale',
      name: 'exhale',
      desc: '',
      args: [],
    );
  }

  /// `Second`
  String get second {
    return Intl.message(
      'Second',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `Choose your duration`
  String get chooseYourDuration {
    return Intl.message(
      'Choose your duration',
      name: 'chooseYourDuration',
      desc: '',
      args: [],
    );
  }

  /// `Start Session`
  String get startSession {
    return Intl.message(
      'Start Session',
      name: 'startSession',
      desc: '',
      args: [],
    );
  }

  /// `Focusing on your breath is a good choice since it is usually the entry point to any meditation practice.`
  String get focusingOnYourBreath {
    return Intl.message(
      'Focusing on your breath is a good choice since it is usually the entry point to any meditation practice.',
      name: 'focusingOnYourBreath',
      desc: '',
      args: [],
    );
  }

  /// `A voluntary breathing practice that sends messages to the brain via the respiratory system`
  String get aVoluntaryBreathing {
    return Intl.message(
      'A voluntary breathing practice that sends messages to the brain via the respiratory system',
      name: 'aVoluntaryBreathing',
      desc: '',
      args: [],
    );
  }

  /// `Energizing yoga practices can help you increase your vitality, improve focus, and boost your overall energy levels. `
  String get energizingYogaPractices {
    return Intl.message(
      'Energizing yoga practices can help you increase your vitality, improve focus, and boost your overall energy levels. ',
      name: 'energizingYogaPractices',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Logout ?`
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are You Sure You Want To Logout ?',
      name: 'areYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi', countryCode: 'IN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
