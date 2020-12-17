import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class ThemeColorInterface {
  bool isDarkTheme;

  ThemeData get data;

  /*******************************************************************
   * General Color                                                   *
   *******************************************************************/

  ///
  /// Main color
  ///
  Color defaultBackgroundColor;
  Color defaultLayeredBackgroundColor;
  Color defaultLayeredBackgroundColorAlpha;
  Color defaultPrimaryColor;
  Color defaultAccentColor;
  Color defaultBorderColor;
  Color defaultDividerColor;
  Color defaultAppbarColor;
  Color navigationColor;
  Color navigationColorFocus;

  ///
  /// Widget color
  ///
  Color defaultWidgetColor;
  Color defaultWidgetBgColor;
  Color defaultSelectableWidgetColor;
  Color defaultDisabledColor;
  Color defaultChipColor;
  Color defaultGridColor;
  Color defaultGridTextColor;
  Color defaultCardColor;
  Color defaultCardTitleColor;
  Color defaultTabUnselectedColor;
  Color defaultTabSelectedColor;
  Color defaultTabSelectedTextColor;
  Color defaultIndicatorColor;

  ///
  /// Side menu color
  ///
  Color drawerIconColor;
  Color drawerIconSubColor;
  Color sideMenuPrimaryColor;
  Color sideMenuSecondaryColor;
  Color sideMenuButtonColor;
  Color sideMenuButtonTextColor;
  Color sideMenuHeaderTextColor;
  Color sideMenuIconColor;
  Color sideMenuIconBgColor;
  Color sideMenuIconTextColor;

  ///
  /// Dialog color
  ///
  Color dialogBgColor;
  Color dialogBgColor0;
  Color dialogBgColor1;
  Color dialogBgTransparent;
  Color dialogTextColor;
  Color dialogTitleColor;
  Color dialogTitleBgColor;
  Color dialogCloseIconColor;

  ///
  /// Text color
  ///
  Color defaultTextColor;
  Color secondaryTextColor1;
  Color secondaryTextColor2;
  Color defaultTitleColor;
  Color defaultSubtitleColor;
  Color defaultHintColor;
  Color defaultHintSubColor;
  Color defaultMessageColor;
  Color defaultErrorColor;

  ///
  /// Hint text color
  ///
  Color hintHighlight;
  Color hintHighlightDarkRed;
  Color hintHighlightRed;
  Color hintHighlightYellow;
  Color hintHighlightLightYellow;
  Color hintHighlightOrange;
  Color hintHighlightOrangeStrong;
  Color hintHyperLink;
  Color hintDarkRed;
  Color hintHighlightNotice;

  ///
  /// Icon color
  ///
  Color iconColor;
  Color iconBgColor;
  Color iconSubColor1;
  Color iconSubColor2;
  Color iconSubColor3;
  Color iconColorGreen;
  Color iconColorYellow;
  Color iconBgColorTrans;
  Color iconTextColor;

  ///
  /// Button color
  ///
  // default color or selected
  Color buttonPrimaryColor;
  Color buttonTextPrimaryColor;

  // unselected button
  Color buttonSecondaryColor;

  // sub color button (ex. readme)
  Color buttonSubColor;
  Color buttonTextSubColor;
  Color buttonDisabledColor;
  Color buttonDisabledColorDark;
  Color buttonDisabledTextColor;
  Color buttonBorderColor;
  Color buttonLinearLightColor1;
  Color buttonLinearLightColor2;
  Color buttonLinearColor1;
  Color buttonLinearColor2;

  Color pagerButtonColor;
  Color pagerButtonSelectedColor;

  Color centerButtonColor;
  Color centerButtonTextColor;
  Color centerButtonBorderColor;
  Color centerButtonStackColor;

  ///
  /// Input field color
  ///
  Color fieldInputColor;
  Color fieldInputBgColor;
  Color fieldReadOnlyBgColor;
  Color fieldInputHintColor;
  Color fieldPrefixBgColor;
  Color fieldPrefixColor;
  Color fieldPrefixSubColor;
  Color fieldSuffixColor;
  Color fieldSuffixSubColor;
  Color fieldInputSubBgColor;
  Color fieldReadOnlySubBgColor;
  Color fieldInputSubColor;
  Color fieldInputHintSubColor;
  Color fieldCursorSubColor;

  ///
  /// Chart table color
  ///
  Color chartBorderColor;
  Color chartPrimaryHeaderColor;
  Color chartPrimaryHeaderTextColor;
  Color chartSecondaryHeaderColor;
  Color chartBgColor;
  Color chartHeaderBgColor;

  /*******************************************************************
   * Specific Page Color                                             *
   *******************************************************************/

  ///
  /// Linear App Bar Color
  ///
  Color barLinearColor1;
  Color barLinearColor2;
  Color barLinearColor3;

  ///
  /// Home page color
  ///
  Color defaultMarqueeBarColor;
  Color defaultMarqueeTextColor;
  Color homeFavoriteColor;
  Color homeTabBgColor;
  Color homeTabDividerColor;
  Color homeTabIconColor;
  Color homeTabIconBgColor;
  Color homeTabTextColor;
  Color homeTabSelectedTextColor;
  Color homeBoxBgColor;
  Color homeBoxHintBgColor;
  Color homeBoxHintTextColor;
  Color homeBoxInfoTextColor;
  Color homeBoxDividerColor;
  Color homeBoxIconColor;
  Color homeBoxIconBgColor;
  Color homeBoxIconTextColor;
  Color homeBoxButtonTextColor;

  Color homeTabSelectedLinearColor1;
  Color homeTabSelectedLinearColor2;
  Color homeTabLinearColor1;
  Color homeTabLinearColor2;

  ///
  /// Promo page color
  ///
  Color promoTabBgColor;
  Color promoTabIconColor;
  Color promoTabTextColor;
  Color promoTabSelectedBgColor;
  Color promoTabSelectedIconColor;
  Color promoTabSelectedTextColor;
  Color promoLinearColor1;
  Color promoLinearColor2;

  ///
  /// Member page color
  ///
  Color memberIconColor;
  Color memberIconLabelColor;
  Color memberIconDecorColor;
  Color memberLinearColor1;
  Color memberLinearColor2;
  Color memberLinearColor3;

  ///
  /// More dialog color
  ///
  Color moreDialogColor;
  Color moreGridColor;

  ///
  /// Notice page color
  ///
  Color noticeTitleColor;
  Color noticeTextColor;
  Color noticeBgColor;

  ///
  /// Balance page color
  ///
  Color balanceCardBackground;
  Color balanceCardLinear1Color;
  Color balanceCardLinear2Color;
  Color balanceCardLinear3Color;
  Color balanceCardTitleColor;
  Color balanceCardTextColor;
  Color balanceActionTextColor;
  Color balanceAction2TextColor;
  Color balanceActionDisableTextColor;
  Color balanceRefreshColor;

  ///
  /// Wallet page color
  ///
  Color walletCardBgColor;
  Color walletCardIconBgColor;
  Color walletBoxBackgroundColor;
  Color walletBoxBorderColor;
  Color walletBoxTitleColor;
  Color walletBoxButtonColor;
  Color walletRadioColor;
  Color walletCreditTitleColor;
  Color walletCreditColor;

  ///
  /// VIP level page & Center VIP color
  ///
  Color vipCardBackgroundColor;
  Color vipTitleBackgroundColor;
  Color vipTitleBackgroundSubColor;
  Color vipIconBackgroundColor;
  Color vipIconColor;
  Color vipIconTextColor;
  Color vipIconTextSubColor;
  Color vipTitleColor;
  Color vipDescColor;
  Color vipLevelTextColor;
  Color vipLinearBgColor1;
  Color vipLinearBgColor2;
  Color vipProgressColor;
  Color vipProgressCircleColor;
  Color vipProgressBorderColor;

  ///
  /// Store page color
  ///
  Color storeDialogBackground;
  Color storeDialogSpanText;
  Color storeProductBgColor;
  Color storeProductBorderColor;
  Color storeRuleTitleColor;
  Color storeRuleHighlightColor;
  Color storeRuleTextColor;
  Color storeButtonColor;
  Color storeHighlightTextColor;

  ///
  /// Roller page color
  ///
  Color rollerBackgroundBlockTop;
  Color rollerBackgroundBlock;
  Color rollerTextCountColor;
  Color rollerTextButtonColor;
  Color rollerRuleBackgroundColor;
  Color rollerRuleTitleColor;
  Color rollerRuleHighlightColor;
  Color rollerRuleTextColor;
  Color rollerDialogTitleColor;
  Color rollerDialogTitleBgColor;
  Color rollerTableHeaderColor;
  Color rollerTableTextColor;
  Color rollerTableDividerColor;
}
