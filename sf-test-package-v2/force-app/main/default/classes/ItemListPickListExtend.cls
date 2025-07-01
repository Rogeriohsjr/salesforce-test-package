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
      listPickListValues.addRow(
        new VisualEditor.DataRow(account.Name, account.Id)
      );
    }

    return listPickListValues;
  }

  private Boolean addMessageIntoList(
    string pMessageTargetPage,
    string pComponentTargetPage
  ) {
    // This should cover old messages which does not have a message Target Page filled out.
    if (String.isBlank(pMessageTargetPage)) {
      return true;
    }

    if (
      pMessageTargetPage == 'lightning-pages' &&
      pComponentTargetPage == 'lightning-pages'
    ) {
      return true;
    }
    if (
      pMessageTargetPage == 'aura-digital-experience' &&
      pComponentTargetPage == 'aura-digital-experience'
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

    try {
      if (Test.isRunningTest()) {
        // Unit Test does not have access to Auth. So by Default this is Lightning Pages.
        return currentContext;
      }

      if (UserInfo.getUserType() == 'Guest') {
        return 'aura-digital-experience';
      }

      // Guest User does not have permission to access Auth.
      Map<string, string> listOfThings = Auth.SessionManagement.getCurrentSession();
      if (listOfThings.containsKey(sessionTypeName)) {
        string sessionTypeValue = listOfThings.get(sessionTypeName);
        if (sessionTypeValue == 'Aura') {
          currentContext = 'lightning-pages';
        } else {
          currentContext = 'aura-digital-experience';
        }
      }
    } catch (Exception e) {
      System.debug('Error in MessageListPickListExtend: ' + e.getMessage());
    }

    return currentContext;
  }
}
