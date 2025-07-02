public with sharing class ItemListPickListExtend extends VisualEditor.DynamicPickList {
  public override VisualEditor.DataRow getDefaultValue() {
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );
    return defaultValue;
  }

  public override VisualEditor.DynamicPickListRows getValues() {
    string currentContext = getComponentContext();

    VisualEditor.DynamicPickListRows listPickListValues = new VisualEditor.DynamicPickListRows();
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );
    listPickListValues.addRow(defaultValue);

    List<Account> accounts = new AccountDAO().getAccounts();
    for (Account account : accounts) {
      Boolean addItem = addMessageIntoList(currentContext, currentContext);

      listPickListValues.addRow(
        new VisualEditor.DataRow(account.Name, String.valueOf(account.Id))
      );
    }

    return listPickListValues;
  }

  private Boolean addMessageIntoList(
    string pMessageTargetPage,
    string pComponentTargetPage
  ) {
    if (
      pMessageTargetPage == 'lightning-pages' &&
      pComponentTargetPage == 'lightning-pages'
    ) {
      return true;
    }

    return false;
  }

  private string getComponentContext() {
    // Getting the Page Context that the component is being render.
    // LWR uses a different
    // Aura and Lightning Pages uses this class and will have this logic for now.
    string sessionTypeName = 'SessionType';
    string currentContext = 'lightning-pages';

    if (UserInfo.getUserType() == 'Guest') {
      return 'aura-digital-experience';
    }

    if (Test.isRunningTest()) {
      // Unit Test does not have access to Auth. So by Default this is Lightning Pages.
      return currentContext;
    }

    // Guest User does not have permission to access Auth.
    Map<string, string> listOfThings = Auth.SessionManagement.getCurrentSession();
    if (listOfThings.containsKey(sessionTypeName)) {
      if (listOfThings.get(sessionTypeName) == 'Aura') {
        return 'lightning-pages';
      }
    }
    return currentContext;
  }
}
