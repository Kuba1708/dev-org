public class DuplicateHandler {
    public static Boolean handleDuplicateInteger(List<Integer> nums){
        Set<Integer> numSet = new Set<Integer>();
        numSet.addAll(nums);
        if(nums.size() != numSet.size()){
            return true;
        }
        return false;
    }
}