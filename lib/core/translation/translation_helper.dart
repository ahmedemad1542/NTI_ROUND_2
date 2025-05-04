import 'package:finance_ui/core/cache/cache_data.dart';
import 'package:finance_ui/core/cache/cache_helper.dart';
import 'package:finance_ui/core/cache/cache_keys.dart';
import 'package:finance_ui/core/translation/ar.dart';
import 'package:finance_ui/core/translation/en.dart';
import 'package:finance_ui/core/translation/translation_keys.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class TranslationHelper implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheKeys.keyAR: ar,
    CacheKeys.keyEN: en,
  };

  static Future setLanguage() async
  {
    CacheData.lang = await CacheHelper.getData(key: CacheKeys.langKey);

    if (CacheData.lang == null)
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyEN);
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheData.lang = CacheKeys.keyEN;
    }
  }

  static changeLanguage(bool isAr)async
  {
    if(isAr)
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyAR);
      await Get.updateLocale(TranslationKeys.localeAR);
      CacheData.lang = CacheKeys.keyAR;
    }
    else
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyEN);
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheData.lang = CacheKeys.keyEN;
    }

  }
}