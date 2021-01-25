import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'theme_color_interface.dart';
import 'theme_data.dart';

class ThemeLight implements ThemeColorInterface {
  @override
  bool isDarkTheme = false;

  ThemeData get data => MyThemeData(this, Brightness.light).getData();

  /*******************************************************************
   * General Color                                                   *
   *******************************************************************/

  ///
  /// Main color
  ///
  @override
  Color defaultBackgroundColor = Color(0xffffffff);

  @override
  Color defaultLayeredBackgroundColor = Color(0xffffffff);

  @override
  Color defaultLayeredBackgroundColorAlpha = Color(0x80ffffff);

  @override
  Color defaultPrimaryColor = Color(0xff8a755a);

  @override
  Color defaultAccentColor = Color(0xffc0a280);

  @override
  Color defaultBorderColor = Color(0xffc1a180);

  @override
  Color defaultDividerColor = Color(0xffc2a280);

  @override
  Color defaultAppbarColor = Color(0xff8a755a);

  @override
  Color navigationColor = Color(0x80f0f0f0);

  @override
  Color navigationColorFocus = Color(0xffffffff);

  ///
  /// Widget color
  ///
  @override
  Color defaultWidgetColor = Color(0xffe7c080);

  @override
  Color defaultWidgetBgColor = Color(0xffdcc4ac);

  @override
  Color defaultSelectableWidgetColor = Color(0xffc0a280);

  @override
  Color defaultActiveWidgetColor = Color(0xffe7c080);

  @override
  Color defaultDisabledColor = Color(0xff989898);

  @override
  Color defaultChipColor = Color(0xffedd1a2);

  @override
  Color defaultGridColor = Color(0xffd8c3af);

  @override
  Color defaultGridTextColor = Color(0xff333333);

  @override
  Color defaultCardColor = Color(0x99ffffff);

  @override
  Color defaultCardTitleColor = Color(0xfff0f0f0);

  @override
  Color defaultTabUnselectedColor = Color.fromARGB(196, 253, 237, 221);

  @override
  Color defaultTabSelectedColor = Color(0xd8ffffff);

  @override
  Color defaultTabSelectedTextColor = Color(0xff8e755f);

  @override
  Color defaultIndicatorColor = Color(0xff8a7363);

  ///
  /// Side menu color
  ///
  @override
  Color drawerIconColor = Color(0xffffffff);

  @override
  Color drawerIconSubColor = Color(0xffffffff);

  @override
  Color sideMenuPrimaryColor = Color(0xffffffff);

  @override
  Color sideMenuSecondaryColor = Color(0xffffffff);

  @override
  Color sideMenuButtonColor = Color(0xffffffff);

  @override
  Color sideMenuButtonTextColor = Color(0xff383838);

  @override
  Color sideMenuHeaderTextColor = Color(0xffffffff);

  @override
  Color sideMenuIconColor = Color(0xffffffff);

  @override
  Color sideMenuIconBgColor = Color(0xffc2a280);

  @override
  Color sideMenuIconTextColor = Color(0xff383838);

  ///
  /// Dialog color
  ///
  @override
  Color dialogBgColor = Color(0xffeaeaea);

  @override
  Color dialogBgColor0 = Color(0xff565656);

  @override
  Color dialogBgColor1 = Color(0xff2a2a2a);

  @override
  Color dialogBgTransparent = Color(0x66bcbcbc);

  @override
  Color dialogTextColor = Color(0xff383838);

  @override
  Color dialogTitleColor = Color(0xff8a755a);

  @override
  Color dialogTitleBgColor = Color(0xffffffff);

  @override
  Color dialogCloseIconColor = Color(0xff303030);

  ///
  /// Text color
  ///
  @override
  Color defaultTextColor = Color(0xff383838);

  @override
  Color secondaryTextColor1 = Color(0xffffffff);

  @override
  Color secondaryTextColor2 = Color(0xff303030);

  @override
  Color defaultTitleColor = Color(0xff303030);

  @override
  Color defaultSubtitleColor = Color(0xff7f4f00);

  @override
  Color defaultHintColor = Color(0xff545454);

  @override
  Color defaultHintSubColor = Color(0xff808080);

  @override
  Color defaultMessageColor = Color(0xff333333);

  @override
  Color defaultErrorColor = Color(0xffe53935);

  ///
  /// Hint text color
  ///
  @override
  Color hintHighlight = Color(0xffff6975);

  @override
  Color hintHighlightDarkRed = Color(0xffe63f3f);

  @override
  Color hintHighlightRed = Color(0xffff0000);

  @override
  Color hintHighlightYellow = Color(0xffffdd3a);

  @override
  Color hintHighlightLightYellow = Color(0xffffe6b1);

  @override
  Color hintHighlightOrange = Color(0xffde9c57);

  @override
  Color hintHighlightOrangeStrong = Color(0xffff9e4c);

  @override
  Color hintHyperLink = Color(0xff23538d);

  @override
  Color hintDarkRed = Color(0xff752121);

  @override
  Color hintHighlightNotice = Color(0xffffffff);

  ///
  /// Icon color
  ///
  @override
  Color iconColor = Color(0xffffffff);

  @override
  Color iconBgColor = Color(0xffc1a180);

  @override
  Color iconSubColor1 = Color(0xffffffff);

  @override
  Color iconSubColor2 = Color(0xff606060);

  @override
  Color iconSubColor3 = Color(0xff3a3a3a);

  @override
  Color iconColorGreen = Color(0xff40b92c);

  @override
  Color iconColorYellow = Color(0xffffdd3a);

  @override
  Color iconBgColorTrans = Color(0x40a4a4a4);

  @override
  Color iconTextColor = Color(0xff3a3a3a);

  ///
  /// Button color
  ///
  @override
  Color buttonPrimaryColor = Color(0xffdcc4ac);

  @override
  Color buttonTextPrimaryColor = Color(0xff202020);

  @override
  Color buttonSecondaryColor = Color(0xffc1a180);

  @override
  Color buttonSubColor = Color(0xff969696);

  @override
  Color buttonTextSubColor = Color(0xff202020);

  @override
  Color buttonDisabledColor = Color(0xff606060);

  @override
  Color buttonDisabledColorDark = Color(0xff888888);

  @override
  Color buttonDisabledTextColor = Color(0xffa0a0a0);

  @override
  Color buttonBorderColor = Color(0xffffffff);

  @override
  Color buttonLinearLightColor1 = Color(0xfffdeddd);

  @override
  Color buttonLinearLightColor2 = Color(0xffdcc4ac);

  @override
  Color buttonLinearColor1 = Color(0xfffceee3);

  @override
  Color buttonLinearColor2 = Color(0xffc1a180);

  @override
  Color pagerButtonColor = Color(0xffd8d8d8);

  @override
  Color pagerButtonSelectedColor = Color(0xffdcc4ac);

  @override
  Color centerButtonColor = Color(0xf0ffffff);

  @override
  Color centerButtonTextColor = Color(0xffe88200);

  @override
  Color centerButtonBorderColor = Color(0xfffec017);

  @override
  Color centerButtonStackColor = Color.fromRGBO(255, 152, 0, 0.1);

  ///
  /// Input field color
  ///
  @override
  Color fieldInputColor = Color(0xff303030);

  @override
  Color fieldInputBgColor = Color(0xffe1e1e1);

  @override
  Color fieldReadOnlyBgColor = Color(0xffd3d3d3);

  @override
  Color fieldInputHintColor = Color(0xff969696);

  @override
  Color fieldPrefixBgColor = Color(0xffffffff);

  @override
  Color fieldPrefixColor = Color(0xff383838);

  @override
  Color fieldPrefixSubColor = Color(0xffffffff);

  @override
  Color fieldSuffixColor = Color(0xffc1a180);

  @override
  Color fieldSuffixSubColor = Color(0xffffffff);

  @override
  Color fieldInputSubBgColor = Color(0xffeee5dc);

  @override
  Color fieldReadOnlySubBgColor = Color(0xff3f3f3f);

  @override
  Color fieldInputSubColor = Color(0xffeaeaea);

  @override
  Color fieldInputHintSubColor = Color(0xffb0b0b0);

  @override
  Color fieldCursorSubColor = Color(0xfff8dfb2);

  ///
  /// Chart table color
  ///
  @override
  Color chartBorderColor = Color(0xffc1a180);

  @override
  Color chartPrimaryHeaderColor = Color(0xffedd1a2);

  @override
  Color chartPrimaryHeaderTextColor = Color(0xffffffff);

  @override
  Color chartSecondaryHeaderColor = Color(0xffa0a0a0);

  @override
  Color chartBgColor = Color(0xffeaeaea);

  @override
  Color chartHeaderBgColor = Color(0xff484848);

  /*******************************************************************
   * Specific Page Color                                             *
   *******************************************************************/
  ///
  /// Linear App Bar Color
  ///
  @override
  Color barLinearColor1 = Color(0xffc0a280);

  @override
  Color barLinearColor2 = Color(0xff8a755a);

  @override
  Color barLinearColor3 = Color(0xff8a755a);

  ///
  /// Home page color
  ///
  @override
  Color defaultMarqueeBarColor = Color(0xb3ffffff);

  @override
  Color defaultMarqueeTextColor = Color(0xff2a2a2a);

  @override
  Color homeFavoriteColor = Color(0xffffffff);

  @override
  Color homeTabBgColor = Color(0xfffdeddd);

  @override
  Color homeTabDividerColor = Color(0xffb08552);

  @override
  Color homeTabIconColor = Color(0xfff0f0f0);

  @override
  Color homeTabIconBgColor = Color(0xff8a7363);

  @override
  Color homeTabTextColor = Color(0xff000000);

  @override
  Color homeTabSelectedTextColor = Color(0xffffffff);

  @override
  Color homeBoxBgColor = Color(0xb3ffffff);

  @override
  Color homeBoxHintBgColor = Color(0xffdcc4ac);

  @override
  Color homeBoxHintTextColor = Color(0xff202020);

  @override
  Color homeBoxInfoTextColor = Color(0xff202020);

  @override
  Color homeBoxDividerColor = Color(0xff545048);

  @override
  Color homeBoxIconColor = Color(0xffffffff);

  @override
  Color homeBoxIconBgColor = Color(0xffe7c080);

  @override
  Color homeBoxIconTextColor = Color(0xff202020);

  @override
  Color homeBoxButtonTextColor = Color(0xff383838);

  @override
  Color homeTabSelectedLinearColor1 = Color(0xff76685f);

  @override
  Color homeTabSelectedLinearColor2 = Color(0xffa8998f);

  @override
  Color homeTabLinearColor1 = Color(0xfffdeddd);

  @override
  Color homeTabLinearColor2 = Color(0xffdcc4ac);

  ///
  /// Promo page color
  ///
  @override
  Color promoTabBgColor = Color(0xffffffff);

  @override
  Color promoTabIconColor = Color(0xffb5b5b5);

  @override
  Color promoTabTextColor = Color(0xffb5b5b5);

  @override
  Color promoTabSelectedBgColor = Color(0xffdcc4ac);

  @override
  Color promoTabSelectedIconColor = Color(0xffffffff);

  @override
  Color promoTabSelectedTextColor = Color(0xffffffff);

  @override
  Color promoLinearColor1 = Color(0xfffdeddd);

  @override
  Color promoLinearColor2 = Color(0xffc0a280);

  ///
  /// Member page color
  ///
  @override
  Color memberIconColor = Color(0xffffffff);

  @override
  Color memberIconLabelColor = Color(0xff383838);

  @override
  Color memberIconDecorColor = Color(0xffc1a180);

  @override
  Color memberLinearColor1 = Color(0xa0feeede);

  @override
  Color memberLinearColor2 = Color(0xffd7c3b3);

  @override
  Color memberLinearColor3 = Color(0xc4feeede);

  ///
  /// More dialog color
  ///
  @override
  Color moreDialogColor = Color(0xffc5c5c5);

  @override
  Color moreGridColor = Color(0xfff0f0f0);

  ///
  /// Notice page color
  ///
  @override
  Color noticeTitleColor = Color(0xffedd1a2);

  @override
  Color noticeTextColor = Color(0xffffffff);

  @override
  Color noticeBgColor = Color(0xff565656);

  ///
  /// Balance page color
  ///
  @override
  Color balanceCardBackground = Color.fromRGBO(241, 218, 168, 0.8);

  @override
  Color balanceCardLinear1Color = Color(0xffb68f72);

  @override
  Color balanceCardLinear2Color = Color(0xffffe6b9);

  @override
  Color balanceCardLinear3Color = Color(0xffd9935c);

  @override
  Color balanceCardTitleColor = Color(0xff464242);

  @override
  Color balanceCardTextColor = Color(0xff7f4f00);

  @override
  Color balanceActionTextColor = Color(0xff000000);

  @override
  Color balanceAction2TextColor = Color(0xff000000);

  @override
  Color balanceActionDisableTextColor = Color(0xff808080);

  @override
  Color balanceRefreshColor = Color(0xff624200);

  ///
  /// Wallet page color
  ///
  @override
  Color walletCardBgColor = Color(0xffffffff);

  @override
  Color walletCardIconBgColor = Color(0xffeeeeee);

  @override
  Color walletBoxBackgroundColor = Color(0xfff0f0f0);

  @override
  Color walletBoxBorderColor = Color(0xffd0d0d0);

  @override
  Color walletBoxTitleColor = Color(0xffe7c080);

  @override
  Color walletBoxButtonColor = Color.fromRGBO(193, 161, 128, 1.0);

  @override
  Color walletRadioColor = Color(0xff303030);

  @override
  Color walletCreditTitleColor = Color(0xff202020);

  @override
  Color walletCreditColor = Color(0xff202020);

  ///
  /// VIP level page & Center VIP color
  ///
  @override
  Color vipCardBackgroundColor = Color(0xffd2d2d2);

  @override
  Color vipTitleBackgroundColor = Color(0xff7f4f00);

  @override
  Color vipTitleBackgroundSubColor = Color(0xfff5f5f5);

  @override
  Color vipIconBackgroundColor = Color(0xffffffff);

  @override
  Color vipIconColor = Color(0xff7f4f00);

  @override
  Color vipIconTextColor = Color(0xffffffff);

  @override
  Color vipIconTextSubColor = Color(0xff000000);

  @override
  Color vipTitleColor = Color(0xff383838);

  @override
  Color vipDescColor = Color(0xff8d8d8d);

  @override
  Color vipLevelTextColor = Color(0xffa28c6c);

  @override
  Color vipLinearBgColor1 = Color(0xfffeeede);

  @override
  Color vipLinearBgColor2 = Color(0xffffffff);

  @override
  Color vipProgressColor = Color(0xffa9a9a9);

  @override
  Color vipProgressCircleColor = Color(0xffa9a9a9);

  @override
  Color vipProgressBorderColor = Color(0xffffd59f);

  ///
  /// Store page color
  ///
  @override
  Color storeDialogBackground = Color(0xfff5f5f5);

  @override
  Color storeDialogSpanText = Color(0xff333333);

  @override
  Color storeProductBgColor = Color(0xffc4c4c4);

  @override
  Color storeProductBorderColor = Color(0xffc4c4c4);

  @override
  Color storeRuleTitleColor = Color(0xff3598db);

  @override
  Color storeRuleHighlightColor = Color(0xffe03e2d);

  @override
  Color storeRuleTextColor = Color(0xff8d8d8d);

  @override
  Color storeButtonColor = Color(0xffcfa972);

  @override
  Color storeHighlightTextColor = Color(0xffe6304a);

  ///
  /// Roller page color
  ///
  @override
  Color rollerBackgroundBlockTop = Color(0xffd2080e);

  @override
  Color rollerBackgroundBlock = Color(0xffe7c080);

  @override
  Color rollerRuleTitleColor = Color(0xffe60000);

  @override
  Color rollerRuleHighlightColor = Color(0xfff1c04f);

  @override
  Color rollerRuleBackgroundColor = Colors.black45;

  @override
  Color rollerRuleTextColor = Color(0xffecf0f1);

  @override
  Color rollerTextButtonColor = Color(0xffde4d41);

  @override
  Color rollerTextCountColor = Color(0xffffffff);

  @override
  Color rollerDialogTitleColor = Color(0xffffffff);

  @override
  Color rollerDialogTitleBgColor = Color(0xffd2080e);

  @override
  Color rollerTableHeaderColor = Color(0xffffffff);

  @override
  Color rollerTableTextColor = Color(0xffffffff);

  @override
  Color rollerTableDividerColor = Color(0xffde4d41);
}
