import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    required this.largeTitle,
    required this.sbLargeTitle,
    required this.title1,
    required this.sbTitle1,
    required this.title2,
    required this.sbTitle2,
    required this.title3,
    required this.sbTitle3,
    required this.headline,
    required this.sbHeadline,
    required this.subHeadline,
    required this.sbSubHeadline,
    required this.body,
    required this.sbBody,
    required this.footnote,
    required this.sbFootnote,
    required this.caption1,
    required this.sbCaption1,
    required this.caption2,
    required this.sbCaption2,
  });

  final TextStyle largeTitle;
  final TextStyle sbLargeTitle;
  final TextStyle title1;
  final TextStyle sbTitle1;
  final TextStyle title2;
  final TextStyle sbTitle2;
  final TextStyle title3;
  final TextStyle sbTitle3;
  final TextStyle headline;
  final TextStyle sbHeadline;
  final TextStyle subHeadline;
  final TextStyle sbSubHeadline;
  final TextStyle body;
  final TextStyle sbBody;
  final TextStyle footnote;
  final TextStyle sbFootnote;
  final TextStyle caption1;
  final TextStyle sbCaption1;
  final TextStyle caption2;
  final TextStyle sbCaption2;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? largeTitle,
    TextStyle? sbLargeTitle,
    TextStyle? title1,
    TextStyle? sbTitle1,
    TextStyle? title2,
    TextStyle? sbTitle2,
    TextStyle? title3,
    TextStyle? sbTitle3,
    TextStyle? headline,
    TextStyle? sbHeadline,
    TextStyle? subHeadline,
    TextStyle? sbSubHeadline,
    TextStyle? body,
    TextStyle? sbBody,
    TextStyle? footnote,
    TextStyle? sbFootnote,
    TextStyle? caption1,
    TextStyle? sbCaption1,
    TextStyle? caption2,
    TextStyle? sbCaption2,
  }) {
    return AppTextTheme(
      largeTitle: largeTitle ?? this.largeTitle,
      sbLargeTitle: sbLargeTitle ?? this.sbLargeTitle,
      title1: title1 ?? this.title1,
      sbTitle1: sbTitle1 ?? this.sbTitle1,
      title2: title2 ?? this.title2,
      sbTitle2: sbTitle2 ?? this.sbTitle2,
      title3: title3 ?? this.title3,
      sbTitle3: sbTitle3 ?? this.sbTitle3,
      headline: headline ?? this.headline,
      sbHeadline: sbHeadline ?? this.sbHeadline,
      subHeadline: subHeadline ?? this.subHeadline,
      sbSubHeadline: sbSubHeadline ?? this.sbSubHeadline,
      body: body ?? this.body,
      sbBody: sbBody ?? this.sbBody,
      footnote: footnote ?? this.footnote,
      sbFootnote: sbFootnote ?? this.sbFootnote,
      caption1: caption1 ?? this.caption1,
      sbCaption1: sbCaption1 ?? this.sbCaption1,
      caption2: caption2 ?? this.caption2,
      sbCaption2: sbCaption2 ?? this.sbCaption2,
    );
  }

  @override
  String toString() {
    return '''
    AppTextTheme(
      largeTitle: $largeTitle,
      sbLargeTitle: $sbLargeTitle,
      title1: $title1,
      sbTitle1: $sbTitle1,
      title2: $title2,
      sbTitle2: $sbTitle2,
      title3: $title3,
      sbTitle3: $sbTitle3,
      headline: $headline,
      sbHeadline: $sbHeadline,
      subHeadline: $subHeadline,
      sbSubHeadline: $sbSubHeadline,
      body: $body,
      sbBody: $sbBody,
      footnote: $footnote,
      sbFootnote: $sbFootnote,
      caption1: $caption1,
      scCaption1: $sbCaption1,
      caption2: $caption2,
      sbCaption2: $sbCaption2,
    )''';
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t) ?? largeTitle,
      sbLargeTitle:
          TextStyle.lerp(sbLargeTitle, other.sbLargeTitle, t) ?? sbLargeTitle,
      title1: TextStyle.lerp(title1, other.title1, t) ?? title1,
      sbTitle1: TextStyle.lerp(sbTitle1, other.sbTitle1, t) ?? sbTitle1,
      title2: TextStyle.lerp(title2, other.title2, t) ?? title2,
      sbTitle2: TextStyle.lerp(sbTitle2, other.sbTitle2, t) ?? sbTitle2,
      title3: TextStyle.lerp(title3, other.title3, t) ?? title3,
      sbTitle3: TextStyle.lerp(sbTitle3, other.sbTitle3, t) ?? sbTitle3,
      headline: TextStyle.lerp(headline, other.headline, t) ?? headline,
      sbHeadline: TextStyle.lerp(sbHeadline, other.sbHeadline, t) ?? sbHeadline,
      subHeadline:
          TextStyle.lerp(subHeadline, other.subHeadline, t) ?? subHeadline,
      sbSubHeadline: TextStyle.lerp(sbSubHeadline, other.sbSubHeadline, t) ??
          sbSubHeadline,
      body: TextStyle.lerp(body, other.body, t) ?? body,
      sbBody: TextStyle.lerp(sbBody, other.sbBody, t) ?? sbBody,
      footnote: TextStyle.lerp(footnote, other.footnote, t) ?? footnote,
      sbFootnote: TextStyle.lerp(sbFootnote, other.sbFootnote, t) ?? sbFootnote,
      caption1: TextStyle.lerp(caption1, other.caption1, t) ?? caption1,
      sbCaption1: TextStyle.lerp(sbCaption1, other.sbCaption1, t) ?? sbCaption1,
      caption2: TextStyle.lerp(caption2, other.caption2, t) ?? caption2,
      sbCaption2: TextStyle.lerp(sbCaption2, other.sbCaption2, t) ?? sbCaption2,
    );
  }
}
