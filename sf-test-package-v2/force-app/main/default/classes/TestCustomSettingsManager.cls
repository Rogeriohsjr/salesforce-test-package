public with sharing class TestCustomSettingsManager {
  public Boolean getSaveMessageCodeInRenderComponent() {
    String value = this.getAppSettingsValueByCode(
      AppSettingsCode.SAVE_MESSAGE_CODE_IN_RENDER_COMPONENT
    );
    return value == 'true' ? true : false;
  }

  private String getAppSettingsValueByCode(AppSettingsCode pCode) {
    TestCustomSettings__c appSettings = TestCustomSettings__c.getValues(
      pCode.name()
    );
    if (appSettings == null) {
      return null;
    }
    return appSettings.Value__c;
  }

  public enum AppSettingsCode {
    SAVE_MESSAGE_CODE_IN_RENDER_COMPONENT
  }
}
