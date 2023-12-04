public class UserHandler {
    public static Map<String,String> getUserData(){
        // String userFirstName = userInfo.getFirstName();
        // String userLastName = userInfo.getLastName()();
        // //String userMail = UserInfo.getUserEmail();
        
        Map<String,String> userInfoMap = new Map<String,String>();
        
        userInfoMap.put('emailId',UserInfo.getUserEmail());
        userInfoMap.put('profileId',UserInfo.getProfileId());
        userInfoMap.put('userName',UserInfo.getUserName());
       
		return userInfoMap;
    }
    
}