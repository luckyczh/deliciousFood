enum DFEnvironment { dev, uat, prd }

class Config {
  static DFEnvironment environment = DFEnvironment.dev;
  static const pageSize = 20;
  static const noNetworkMsg = "暂无网络连接,请检查网络设置";
}
