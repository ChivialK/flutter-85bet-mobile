import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test router regex', () {
    expect("[7]".replaceAll(RegExp(r'[\u005b|\u005d]'), ''), '7');
  });

  test('test router regex', () {
    String tyRoute7Url = 'https://www.vip66725.com/';
    String tyRoute6Url = 'https://www.vip66656.com/';
    String tyRoute4Url = 'https://www.vip66432.com/';
    expect('${Global.CURRENT_BASE}'.isRouteUrl, true);
    expect(tyRoute7Url.testTyRouteUrl, true);
    expect(tyRoute6Url.testTyRouteUrl, true);
    expect(tyRoute4Url.testTyRouteUrl, false);
  });

  test('test url regex', () {
    String openUrl = 'https://www.youtube.com/';
    String openUrl2 = 'https://www.vn365s.com/api/open/sb365/sport/0';
    expect(openUrl.isUrl, true);
    expect(
        openUrl2.substring(
            openUrl2.indexOf(Global.DOMAIN_NAME) + Global.DOMAIN_NAME.length),
        '/api/open/sb365/sport/0');
    expect(
        openUrl2
            .substring(openUrl2.indexOf(Global.DOMAIN_NAME) +
                Global.DOMAIN_NAME.length)
            .replaceAll('/api/open/', ''),
        'sb365/sport/0');
  });

  test('test game regex', () {
    String openGameUrl = 'https://eg990.com/api/open/eg/casino/0';
    String openGameUrl2 = 'https://eg990.com/api/openUrl/eg/slot/candy';
    expect(openGameUrl.isRouteUrl, true);
    expect(openGameUrl.isGameUrl, true);
    expect(openGameUrl2.isGameAutoUrl, true);
  });

  test('test regex', () {
    String imageUrl = 'https://eg990.com/images/nav.png';
    String imageUrl2 = 'https://eg990.com/images/nav';
    String imageUrl3 = 'https://eg990.com/image/nav.png';
    expect(imageUrl.isImageUrl, true);
    expect(imageUrl2.isImageUrl, false);
    expect(imageUrl3.isImageUrl, false);
  });

  test('test date regex', () {
    String date = '1990-01-01';
    expect(date.isValidDate, true);
  });

  test('test chinese regex', () {
    String testStr1 = '123';
    expect(testStr1.hasChinese, false);
    String testStr2 = 'abc';
    expect(testStr2.hasChinese, false);
    String testStr3 = '一';
    expect(testStr3.hasChinese, true);
    String testStr4 = '一二3';
    expect(testStr4.hasChinese, true);
    String testStr5 = '一2三';
    expect(testStr5.hasChinese, true);
  });

  test('test mix string to int', () {
    String mixStr = 'failure(code: 8000)';
    String extract = mixStr.replaceAll(RegExp('[^0-9]'), '');
    print('extract int:　$extract');
    expect(int.parse(extract), 8000);
  });

  test('test html regex', () {
    String html =
        """<html><head><title></title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head><body onload=''><form id='post_form' name='post_form' method=post action='https://777.bb-api.net'><input name=uid  type='hidden' value='05fe8bca59b4bdd73785da942ed38d9406b2ab76'><input name=langx type='hidden' value='zh-cn'><input name=page_site type='hidden' value='ball'></form></body></html>""";
    expect(html.isHtmlFormat, true);
  });

  test('test html regex 2', () {
    String html = """<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <!-- <body onload=''> -->
    <body'>
        <form id='post_form' name='post_form' method=post action='https://777.bb-api.net'>
            <input name=uid  type='hidden' value='7e4f30e0e5be4a889c2ee5d3d8ae4db399c48e37'>
            <input name=langx type='hidden' value='zh-cn'>
            <input name=page_site type='hidden' value='live'>
            <input name='live_present' type='hidden' value='bbinlive'>
        </form>
        <script>window.location.replace('https://kpy0ydbp.com/ipl/portal.php/game/httpredirect?type=liverwd&domain=https%3A%2F%2F777.bb-api.net%2F&hallid=3820062&lang=cn&ots=b4844bd26fb274a0d95026454653c111f57f8d69')</script>
    </body>
    </html>""";
    expect(html.replaceAll('\n', '').isHtmlFormat, true);
  });
}
