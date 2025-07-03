public with sharing class ItemListPickListExtend extends VisualEditor.DynamicPickList {
  public override VisualEditor.DataRow getDefaultValue() {
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );
    return defaultValue;
  }

  public override VisualEditor.DynamicPickListRows getValues() {
    VisualEditor.DynamicPickListRows listPickListValues = new VisualEditor.DynamicPickListRows();
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );
    listPickListValues.addRow(defaultValue);

    TestCustomSettingsManager testCustomSettingsManager = new TestCustomSettingsManager();
    Boolean saveMessageCodeInRenderComponent = testCustomSettingsManager.getSaveMessageCodeInRenderComponent();
    System.debug(
      'saveMessageCodeInRenderComponent: ' + saveMessageCodeInRenderComponent
    );

    List<Account> accounts = new AccountDAO().getAccounts();
    for (Account account : accounts) {
      listPickListValues.addRow(
        new VisualEditor.DataRow(account.Name, String.valueOf(account.Id))
      );
    }

    return listPickListValues;
  }
}
