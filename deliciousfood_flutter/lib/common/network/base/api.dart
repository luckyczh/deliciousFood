class Api {
  /// 服务器地址
  static const baseUrl = "https://newapi.meishi.cc";

  /// 首页推荐
  static const homeRecommend = "/indexnew/home_recommend_7_1_3";

  /// 菜谱分类
  static const recipeCategory = "/indexnew/categorylist";

  /// 首页feed流数据
  static const homeFeed = "/indexnew/home_feeds_7_1_3";

  /// 菜谱详情
  static const recipeDetail = "/recipenew/detail";

  /// 菜谱营养详情
  static const nutritionDetail = "/recipenew/yingyang_info";

  /// 菜谱详情推荐
  static const recipeDetailRecommed = "/searchnew/recipe_recommend";

  /// 排行榜列表
  static const rankList = "/reciperanking/list";

  /// 吃什么列表
  static const eatList = "/scenenew/index_new";

  /// 获取用户信息
  static const personInfo = "/Personalnew/myHome";

  /// 我的收藏
  static const personFavoriteList = "/favnew/fav_recipe_list_7_1_1";

  /// 最近浏览
  static const personRecentList = "/Recentnew/recent_list_7_1_1";

  /// 删除浏览记录
  static const deleteRecent = "/recentnew/delete_recent";

  /// 发送验证码
  static const sendMsg = "/user/mobile_code";

  /// 验证码登录
  static const codeLogin = "user/login_phone";
}
