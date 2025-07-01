public inherited sharing class AccountDAO {
  public AccountDAO() {
  }

  public List<Account> getAccounts() {
    return [SELECT Id, Name FROM Account LIMIT 10];
  }
}
