import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'theme_color_interface.dart';
import 'theme_data.dart';

class ThemeDark implements ThemeColorInterface {
  @override
  bool isDarkTheme = true;

  ThemeData get data => MyThemeData(this, Brightness.dark).getData();

  /*******************************************************************
   * General Color                                                   *
   *******************************************************************/

  ///
  /// Main color
  ///
  @override
  Color defaultBackgroundColor = Color(0xff3e3a39);

  @override
  Color defaultLayeredBackgroundColor = Color(0xff34302f);

  @override
  Color defaultLayeredBackgroundColorAlpha = Color(0xcc000000);

  @override
  Color defaultPrimaryColor = Color(0xff38394b);

  @override
  Color defaultAccentColor = Color(0xffe7c080);

  @override
  Color defaultBorderColor = Color(0xffe7c080);

  @override
  Color defaultDividerColor = Color(0xffa8a8a8);

  @override
  Color defaultAppbarColor = Color(0xff423e3d);

  @override
  Color navigationColor = Color(0xffb5b5b5);

  @override
  Color navigationColorFocus = Color(0xffe7c080);

  ///
  /// Widget color
  ///
  @override
  Color defaultWidgetColor = Color(0xfff5f5f5);

  @override
  Color defaultWidgetBgColor = Color(0xff383838);

  @override
  Color defaultSelectableWidgetColor = Color(0xffc7c7c7);

  @override
  Color defaultActiveWidgetColor = Color(0xffe7c080);

  @override
  Color defaultDisabledColor = Color(0xff575757);

  @override
  Color defaultChipColor = Color(0xffedd1a2);

  @override
  Color defaultGridColor = Color(0x73000000);

  @override
  Color defaultGridTextColor = Color(0xfff0f0f0);

  @override
  Color defaultCardColor = Color(0xff606060);

  @override
  Color defaultCardTitleColor = Color(0xff2a60ba);

  @override
  Color defaultTabUnselectedColor = Color(0xff72665b);

  @override
  Color defaultTabSelectedColor = Color(0xff34302f);

  @override
  Color defaultTabSelectedTextColor = Color(0xffe7c080);

  @override
  Color defaultIndicatorColor = Color(0xff8e755f);

  ///
  /// Side menu color
  ///
  @override
  Color drawerIconColor = Color(0xffe7c080);

  @override
  Color drawerIconSubColor = Color(0xffffffff);

  @override
  Color sideMenuPrimaryColor = Color(0xff464242);

  @override
  Color sideMenuSecondaryColor = Color(0xff313131);

  @override
  Color sideMenuButtonColor = Color(0xfff4daa3);

  @override
  Color sideMenuButtonTextColor = Color(0xff000000);

  @override
  Color sideMenuHeaderTextColor = Color(0xffffffff);

  @override
  Color sideMenuIconColor = Color(0xffffffff);

  @override
  Color sideMenuIconBgColor = Color(0xff222222);

  @override
  Color sideMenuIconTextColor = Color(0xffffffff);

  ///
  /// Dialog color
  ///
  @override
  Color dialogBgColor = Color(0xff424242);

  @override
  Color dialogBgColor0 = Color(0xff606266);

  @override
  Color dialogBgColor1 = Color(0xff2a2a2a);

  @override
  Color dialogBgTransparent = Color(0xD0383838);

  @override
  Color dialogTextColor = Color(0xffe6e6e6);

  @override
  Color dialogTitleColor = Color(0xffe7c080);

  @override
  Color dialogTitleBgColor = Color(0xff5b5b5b);

  @override
  Color dialogCloseIconColor = Color(0xffe6e6e6);

  ///
  /// Text color
  ///
  @override
  Color defaultTextColor = Color(0xffb5b5b5);

  @override
  Color secondaryTextColor1 = Color(0xff222222);

  @override
  Color secondaryTextColor2 = Color(0xffececec);

  @override
  Color defaultTitleColor = Color(0xffe7c080);

  @override
  Color defaultSubtitleColor = Color(0xffeea942);

  @override
  Color defaultHintColor = Color(0xffdadada);

  @override
  Color defaultHintSubColor = Color(0xff808080);

  @override
  Color defaultMessageColor = Color(0xffbcbcbc);

  @override
  Color defaultErrorColor = Color(0xffe53935);

  ///
  /// Hint text color
  ///
  @override
  Color hintHighlight = Color(0xffff7eb8);

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
  Color hintHyperLink = Color(0xff82f8ff);

  @override
  Color hintDarkRed = Color(0xff752121);

  @override
  Color hintHighlightNotice = Color(0xffffffff);

  ///
  /// Icon color
  ///
  @override
  Color iconColor = Color(0xffc1a180);

  @override
  Color iconBgColor = Color(0xcc25272c);

  @override
  Color iconSubColor1 = Color(0xffa4a4a4);

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
  Color iconTextColor = Color(0xffe7c080);

  ///
  /// Button color
  ///
  @override
  Color buttonPrimaryColor = Color(0xffe7c080);

  @override
  Color buttonTextPrimaryColor = Color(0xff000000);

  @override
  Color buttonSecondaryColor = Color(0xcc3f3b3a);

  @override
  Color buttonSubColor = Color(0x8A000000);

  @override
  Color buttonTextSubColor = Color(0xffe7c080);

  @override
  Color buttonDisabledColor = Color(0xffa9a9a9);

  @override
  Color buttonDisabledColorDark = Color(0xc03a3a3a);

  @override
  Color buttonDisabledTextColor = Color(0xff575757);

  @override
  Color buttonBorderColor = Color(0xffc1a180);

  @override
  Color buttonLinearLightColor1 = Color(0xfffdeddd);

  @override
  Color buttonLinearLightColor2 = Color(0xffc0a280);

  @override
  Color buttonLinearColor1 = Color(0xfffff5e2);

  @override
  Color buttonLinearColor2 = Color(0xffd1975d);

  @override
  Color pagerButtonColor = Color(0xff4e4e4e);

  @override
  Color pagerButtonSelectedColor = Color(0xff3b3b3b);

  @override
  Color centerButtonColor = Color(0xf0423e3d);

  @override
  Color centerButtonShadowColor = Color(0xffd08200);

  @override
  Color centerButtonBorderColor = Color(0xfff39800);

  @override
  Color centerButtonStackColor = Color.fromRGBO(255, 152, 0, 0.1);

  ///
  /// Input field color
  ///
  @override
  Color fieldInputColor = Color(0xffffffff);

  @override
  Color fieldInputSubColor = Color(0xff000000);

  @override
  Color fieldInputBgColor = Color(0xff4e4e4e);

  @override
  Color fieldInputSubBgColor = Color(0xffffffff);

  @override
  Color fieldReadOnlyBgColor = Color(0xff404040);

  @override
  Color fieldReadOnlySubBgColor = Color(0xffd3d3d3);

  @override
  Color fieldInputHintColor = Color(0xffa4a4a4);

  @override
  Color fieldInputHintSubColor = Color(0xff383838);

  @override
  Color fieldDropdownColor = Color(0xff4e4e4e);

  @override
  Color fieldDropdownSubColor = Color(0xffffffff);

  @override
  Color fieldPrefixBgColor = Color(0xff383838);

  @override
  Color fieldPrefixColor = Color(0xffd9d9d9);

  @override
  Color fieldPrefixSubColor = Color(0xffffffff);

  @override
  Color fieldSuffixColor = Color(0xffe7c080);

  @override
  Color fieldSuffixSubColor = Color(0xffffffff);

  @override
  Color fieldCursorColor = Color(0xffe7c080);

  @override
  Color fieldCursorSubColor = Color(0xff000000);

  ///
  /// Chart table color
  ///
  @override
  Color chartBorderColor = Color(0xff6a6a6a);

  @override
  Color chartPrimaryHeaderColor = Color(0xffffffff);

  @override
  Color chartPrimaryHeaderTextColor = Color(0xff303030);

  @override
  Color chartSecondaryHeaderColor = Color(0xff484848);

  @override
  Color chartBgColor = Color(0xff3a3a3a);

  @override
  Color chartHeaderBgColor = Color(0xffffd89c);

  /*******************************************************************
   * Specific Page Color                                             *
   *******************************************************************/
  ///
  /// Linear App Bar Color
  ///
  @override
  Color barLinearColor1 = Color(0xff3e3a39);

  @override
  Color barLinearColor2 = Color(0xff4D4B4C);

  @override
  Color barLinearColor3 = Color(0xff3e3a39);

  ///
  /// Home page color
  ///
  @override
  Color defaultMarqueeBarColor = Color(0xb03e3a39);

  @override
  Color defaultMarqueeTextColor = Color(0xfff0f0f0);

  @override
  Color homeFavoriteColor = Color(0xffffffff);

  @override
  Color homeTabBgColor = Color(0xff34302f);

  @override
  Color homeTabDividerColor = Color(0xffb08552);

  @override
  Color homeTabIconColor = Color(0xffe7c080);

  @override
  Color homeTabIconBgColor = Color(0xff3e3a39);

  @override
  Color homeTabTextColor = Color(0xffe7c080);

  @override
  Color homeTabSelectedTextColor = Color(0xffffffff);

  @override
  Color homeBoxBgColor = Color(0xb03e3a39);

  @override
  Color homeBoxHintBgColor = Color(0xffe7c080);

  @override
  Color homeBoxHintTextColor = Color(0xff000000);

  @override
  Color homeBoxInfoTextColor = Color(0xffe7c080);

  @override
  Color homeBoxDividerColor = Color(0xff545048);

  @override
  Color homeBoxIconColor = Color(0xffe7c080);

  @override
  Color homeBoxIconBgColor = Color(0xffe7c080);

  @override
  Color homeBoxIconTextColor = Color(0xffffffff);

  @override
  Color homeBoxButtonTextColor = Color(0xffe7c080);

  @override
  Color homeTabSelectedLinearColor1 = Color(0xff786e64);

  @override
  Color homeTabSelectedLinearColor2 = Color(0xff49413e);

  @override
  Color homeTabLinearColor1 = Color(0xff3e3a39);

  @override
  Color homeTabLinearColor2 = Color(0xff595758);

  ///
  /// Promo page color
  ///
  @override
  Color promoTabBgColor = Color(0xff000000);

  @override
  Color promoTabIconColor = Color(0xffe7c080);

  @override
  Color promoTabTextColor = Color(0xffb5b5b5);

  @override
  Color promoTabSelectedBgColor = Color(0xffe7c080);

  @override
  Color promoTabSelectedIconColor = Color(0xff3a3a3a);

  @override
  Color promoTabSelectedTextColor = Color(0xff000000);

  @override
  Color promoLinearColor1 = Color(0xcc3f3b3a);

  @override
  Color promoLinearColor2 = Color(0xff25272c);

  ///
  /// Member page color
  ///
  @override
  Color memberIconColor = Color(0xffe7c080);

  @override
  Color memberIconLabelColor = Color(0xffe7c080);

  @override
  Color memberIconDecorColor = Color(0xcc3f3b3a);

  @override
  Color memberLinearColor1 = Color(0xcc25272c);

  @override
  Color memberLinearColor2 = Color(0x7f7e746a);

  @override
  Color memberLinearColor3 = Color(0xcc25272c);

  ///
  /// More dialog color
  ///
  @override
  Color moreDialogColor = Color(0xff2a2a2a);

  @override
  Color moreGridColor = Color(0xff424242);

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
  Color balanceCardBackground = Color(0xff424242);

  @override
  Color balanceCardLinear1Color = Color(0xcca6886e);

  @override
  Color balanceCardLinear2Color = Color(0xccf1daa8);

  @override
  Color balanceCardLinear3Color = Color(0xccce9055);

  @override
  Color balanceCardTitleColor = Color(0xff464242);

  @override
  Color balanceCardTextColor = Color(0xff7f4f00);

  @override
  Color balanceActionTextColor = Color(0xff303030);

  @override
  Color balanceAction2TextColor = Color(0xff303030);

  @override
  Color balanceActionDisableTextColor = Color(0xffc6c6c6);

  @override
  Color balanceRefreshColor = Color(0xff624200);

  ///
  /// Wallet page color
  ///
  @override
  Color walletCardBgColor = Color(0xff3a3a3a);

  @override
  Color walletCardIconBgColor = Color(0xff575757);

  @override
  Color walletBoxBackgroundColor = Color(0xff272727);

  @override
  Color walletBoxBorderColor = Color(0xff575757);

  @override
  Color walletBoxTitleColor = Color(0xffffe6b1);

  @override
  Color walletBoxButtonColor = Color(0xffffe6b1);

  @override
  Color walletRadioColor = Color(0xffe7c080);

  @override
  Color walletCreditTitleColor = Color(0xffe7c080);

  @override
  Color walletCreditColor = Color(0xffe7c080);

  ///
  /// VIP level page & Center VIP color
  ///
  @override
  Color vipCardBackgroundColor = Color(0xff424242);

  @override
  Color vipTitleBackgroundColor = Color(0xff3a3a3a);

  @override
  Color vipTitleBackgroundSubColor = Color(0xff4e4e4e);

  @override
  Color vipIconBackgroundColor = Color(0xffa4a4a4);

  @override
  Color vipIconColor = Color(0xffe7c080);

  @override
  Color vipIconTextColor = Color(0xfff0f0f0);

  @override
  Color vipIconTextSubColor = Color(0xff000000);

  @override
  Color vipTitleColor = Color(0xffe7c080);

  @override
  Color vipDescColor = Color(0xffe7c080);

  @override
  Color vipLevelTextColor = Color(0xfff0f0f0);

  @override
  Color vipLinearBgColor1 = Color(0xff585656);

  @override
  Color vipLinearBgColor2 = Color(0xcc3f3a39);

  @override
  Color vipProgressColor = Color(0xffa9a9a9);

  @override
  Color vipProgressCircleColor = Color(0xffa9a9a9);

  @override
  Color vipProgressBorderColor = Color(0xffe7c080);

  ///
  /// Store page color
  ///
  @override
  Color storeDialogBackground = Color(0xff606266);

  @override
  Color storeDialogSpanText = Color(0xffb5b5b5);

  @override
  Color storeProductBgColor = Color(0xff606060);

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
  Color storeHighlightTextColor = Color(0xffff9e4c);

  ///
  /// Roller page color
  ///
  @override
  Color rollerBackgroundBlockTop = Color(0xffd2080e);

  @override
  Color rollerBackgroundBlock = Color(0xffe7c080);

  @override
  Color rollerRuleBackgroundColor = Colors.black45;

  @override
  Color rollerRuleTitleColor = Color(0xffe60000);

  @override
  Color rollerRuleHighlightColor = Color(0xfff1c04f);

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
