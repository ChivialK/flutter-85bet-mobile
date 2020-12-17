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
  Color defaultBackgroundColor = Color(0xffeaeaea);

  @override
  Color defaultLayeredBackgroundColor = Color(0xffffffff);

  @override
  Color defaultLayeredBackgroundColorAlpha = Color(0x80ffffff);

  @override
  Color defaultPrimaryColor = Color(0xff38394b);

  @override
  Color defaultAccentColor = Color(0xff1a77df);

  @override
  Color defaultBorderColor = Color(0xff606084);

  @override
  Color defaultDividerColor = Color(0xff4a4a4a);

  @override
  Color defaultAppbarColor = Color(0xff38394b);

  @override
  Color navigationColor = Color(0x80f0f0f0);

  @override
  Color navigationColorFocus = Color(0xffffffff);

  ///
  /// Widget color
  ///
  @override
  Color defaultWidgetColor = Color(0xfff5f5f5);

  @override
  Color defaultWidgetBgColor = Color(0xff1a77df);

  @override
  Color defaultSelectableWidgetColor = Color(0xff1a77df);

  @override
  Color defaultDisabledColor = Color(0xff989898);

  @override
  Color defaultChipColor = Color(0xffedd1a2);

  @override
  Color defaultGridColor = Color(0x99FFFFFF);

  @override
  Color defaultGridTextColor = Color(0xff424242);

  @override
  Color defaultCardColor = Color(0x99FFFFFF);

  @override
  Color defaultCardTitleColor = Color(0xff2a60ba);

  @override
  Color defaultTabUnselectedColor = Color(0xffb5b5b5);

  @override
  Color defaultTabSelectedColor = Color(0xd8ffffff);

  @override
  Color defaultTabSelectedTextColor = Color(0xff8e755f);

  @override
  Color defaultIndicatorColor = Color(0xff3f3f5a);

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
  Color sideMenuIconBgColor = Color(0xff1a77df);

  @override
  Color sideMenuIconTextColor = Color(0xff383838);

  ///
  /// Dialog color
  ///
  @override
  Color dialogBgColor = Color(0xffeaeaea);

  @override
  Color dialogBgColor0 = Color(0xff606266);

  @override
  Color dialogBgColor1 = Color(0xff2a2a2a);

  @override
  Color dialogBgTransparent = Color(0x66bcbcbc);

  @override
  Color dialogTextColor = Color(0xff383838);

  @override
  Color dialogTitleColor = Color(0xff1561b7);

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
  Color defaultSubtitleColor = Color(0xff4285f4);

  @override
  Color defaultHintColor = Color(0xff545454);

  @override
  Color defaultHintSubColor = Color(0xffa8a8a8);

  @override
  Color defaultMessageColor = Color(0xff424242);

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
  Color iconBgColor = Color(0xff4285f4);

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
  Color buttonPrimaryColor = Color(0xff2a60ba);

  @override
  Color buttonTextPrimaryColor = Color(0xffffffff);

  @override
  Color buttonSecondaryColor = Color(0xffd2d2d2);

  @override
  Color buttonSubColor = Color(0xff969696);

  @override
  Color buttonTextSubColor = Color(0xffc8c8c8);

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
  Color buttonLinearLightColor2 = Color(0xff91cbff);

  @override
  Color buttonLinearColor1 = Color(0xfffceee3);

  @override
  Color buttonLinearColor2 = Color(0xff409cf3);

  @override
  Color pagerButtonColor = Color(0xff828282);

  @override
  Color pagerButtonSelectedColor = Color(0xff3b3b3b);

  @override
  Color centerButtonColor = Color(0xf0ffffff);

  @override
  Color centerButtonTextColor = Color(0xff3751f3);

  @override
  Color centerButtonBorderColor = Color(0xff409cf3);

  @override
  Color centerButtonStackColor = Color.fromRGBO(0, 152, 255, 0.1);

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
  Color fieldSuffixColor = Color(0xff2a60ba);

  @override
  Color fieldSuffixSubColor = Color(0xffffffff);

  @override
  Color fieldInputSubBgColor = Color(0xff686868);

  @override
  Color fieldReadOnlySubBgColor = Color(0xff3f3f3f);

  @override
  Color fieldInputSubColor = Color(0xffeaeaea);

  @override
  Color fieldInputHintSubColor = Color(0xffb0b0b0);

  @override
  Color fieldCursorSubColor = Color(0xff90caf9);

  ///
  /// Chart table color
  ///
  @override
  Color chartBorderColor = Color(0xff969696);

  @override
  Color chartPrimaryHeaderColor = Color(0xff2a60ba);

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
  Color barLinearColor1 = Color(0xff80a2c0);

  @override
  Color barLinearColor2 = Color(0xff3a75aa);

  @override
  Color barLinearColor3 = Color(0xff3a75aa);

  ///
  /// Home page color
  ///
  @override
  Color defaultMarqueeBarColor = Color(0xf0797999);

  @override
  Color defaultMarqueeTextColor = Color(0xfff0f0f0);

  @override
  Color homeFavoriteColor = Color(0xffffffff);

  @override
  Color homeTabBgColor = Color(0xfffdeddd);

  @override
  Color homeTabDividerColor = Color(0xff1a77df);

  @override
  Color homeTabIconColor = Color(0xfff0f0f0);

  @override
  Color homeTabIconBgColor = Color(0xff1a77df);

  @override
  Color homeTabTextColor = Color(0xff1a77df);

  @override
  Color homeTabSelectedTextColor = Color(0xffffffff);

  @override
  Color homeBoxBgColor = Color(0xff515175);

  @override
  Color homeBoxHintBgColor = Color(0xff1a77df);

  @override
  Color homeBoxHintTextColor = Color(0xffffffff);

  @override
  Color homeBoxInfoTextColor = Color(0xffffffff);

  @override
  Color homeBoxDividerColor = Color(0xff606084);

  @override
  Color homeBoxIconColor = Color(0xffffffff);

  @override
  Color homeBoxIconBgColor = Color(0xff80c0e7);

  @override
  Color homeBoxIconTextColor = Color(0xffffffff);

  @override
  Color homeBoxButtonTextColor = Color(0xff383838);

  @override
  Color homeTabSelectedLinearColor1 = Color(0xff7687ac);

  @override
  Color homeTabSelectedLinearColor2 = Color(0xff587cb1);

  @override
  Color homeTabLinearColor1 = Color(0xffddedfd);

  @override
  Color homeTabLinearColor2 = Color(0xffacc4dc);

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
  Color promoTabSelectedBgColor = Color(0xff1a77df);

  @override
  Color promoTabSelectedIconColor = Color(0xffffffff);

  @override
  Color promoTabSelectedTextColor = Color(0xffffffff);

  @override
  Color promoLinearColor1 = Color(0xffddedfd);

  @override
  Color promoLinearColor2 = Color(0xff80a2c0);

  ///
  /// Member page color
  ///
  @override
  Color memberIconColor = Color(0xff2a60ba);

  @override
  Color memberIconLabelColor = Color(0xffffffff);

  @override
  Color memberIconDecorColor = Color(0xff80a2c0);

  @override
  Color memberLinearColor1 = Color(0xff1f44ba);

  @override
  Color memberLinearColor2 = Color(0xff4285f4);

  @override
  Color memberLinearColor3 = Color(0xff2a60ba);

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
  Color noticeTitleColor = Color(0xff2ad1ed);

  @override
  Color noticeTextColor = Color(0xffffffff);

  @override
  Color noticeBgColor = Color(0xff565656);

  ///
  /// Balance page color
  ///
  @override
  Color balanceCardBackground = Color(0xfff5f5f5);

  @override
  Color balanceCardLinear1Color = Color(0xff587cb1);

  @override
  Color balanceCardLinear2Color = Color(0xff7687ac);

  @override
  Color balanceCardLinear3Color = Color(0xff587cb1);

  @override
  Color balanceCardTitleColor = Color(0xff515175);

  @override
  Color balanceCardTextColor = Color(0xff2a60ba);

  @override
  Color balanceActionTextColor = Color(0xffff9e4c);

  @override
  Color balanceAction2TextColor = Color(0xffe63f3f);

  @override
  Color balanceActionDisableTextColor = Color(0xffb7b7b7);

  @override
  Color balanceRefreshColor = Color(0xffc0c0c0);

  ///
  /// Wallet page color
  ///
  @override
  Color walletCardBgColor = Color(0xff4285f4);

  @override
  Color walletCardIconBgColor = Color(0xffeeeeee);

  @override
  Color walletBoxBackgroundColor = Color.fromRGBO(42, 96, 186, 0.1);

  @override
  Color walletBoxBorderColor = Color(0xff2a60ba);

  @override
  Color walletBoxTitleColor = Color(0xffffffff);

  @override
  Color walletBoxButtonColor = Color(0xff09347b);

  @override
  Color walletRadioColor = Color(0xff484848);

  @override
  Color walletCreditTitleColor = Color(0xff2a60ba);

  @override
  Color walletCreditColor = Color(0xff2a60ba);

  ///
  /// VIP level page & Center VIP color
  ///
  @override
  Color vipCardBackgroundColor = Color(0xffd2d2d2);

  @override
  Color vipTitleBackgroundColor = Color(0xff4285f4);

  @override
  Color vipTitleBackgroundSubColor = Color(0xfff5f5f5);

  @override
  Color vipIconBackgroundColor = Color(0xffffffff);

  @override
  Color vipIconColor = Color(0xff4285f4);

  @override
  Color vipIconTextColor = Color(0xffffffff);

  @override
  Color vipIconTextSubColor = Color(0xff000000);

  @override
  Color vipTitleColor = Color(0xff2a60ba);

  @override
  Color vipDescColor = Color(0xff8d8d8d);

  @override
  Color vipLevelTextColor = Color(0xff424242);

  @override
  Color vipLinearBgColor1 = Color(0xffffffff);

  @override
  Color vipLinearBgColor2 = Color(0xfff5f5f5);

  @override
  Color vipProgressColor = Color(0xffa9a9a9);

  @override
  Color vipProgressCircleColor = Color(0xff2a60ba);

  @override
  Color vipProgressBorderColor = Color(0xff2a60ba);

  ///
  /// Store page color
  ///
  @override
  Color storeDialogBackground = Color(0xfff5f5f5);

  @override
  Color storeDialogSpanText = Color(0xff424242);

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
  Color storeHighlightTextColor = Color(0xffff6975);

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
