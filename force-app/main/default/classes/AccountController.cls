public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getRecentAccounts() {
        return [
            SELECT Id, Name, Industry, AnnualRevenue, Phone 
            FROM Account 
            WITH USER_MODE 
            ORDER BY CreatedDate DESC 
            LIMIT 10
        ];
    }
}