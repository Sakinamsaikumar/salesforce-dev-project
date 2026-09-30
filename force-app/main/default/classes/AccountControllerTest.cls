@isTest
private class AccountControllerTest {
    @testSetup
    static void setupTestData() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(
                Name = 'Test Enterprise Account ' + i,
                Industry = 'Technology',
                Phone = '1234567890'
            ));
        }
        insert accounts;
    }

    @isTest
    static void testGetRecentAccounts() {
        Test.startTest();
        List<Account> result = AccountController.getRecentAccounts();
        Test.stopTest();

        System.assertNotEquals(null, result, 'Result list should not be null');
        System.assertEquals(5, result.size(), 'Should return the 5 created test accounts');
    }
}